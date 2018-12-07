package project.servlet;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.sql.*;
import java.util.logging.SimpleFormatter;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.MultipartRequest;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class api extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private Connection conn = null;
    private ResultSet rs = null;
    private PreparedStatement pstmt = null;

    public void init() throws ServletException {
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hdbwork", "hstud", "gkrtod123A!");
        }catch (SQLException e) { e.printStackTrace(); };
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        Cookie[] cookies = req.getCookies();

        JSONObject respJsonObj = new JSONObject();
        JSONObject structJsonObj = new JSONObject();
        JSONArray structJsonArray = new JSONArray();
        if(isValidate(cookies)){
            String uploadPath = req.getSession().getServletContext()
                    .getRealPath("project/img");

            MultipartRequest multi = null;

            try {
                multi = new MultipartRequest(
                        req, uploadPath, 1024*1024*100, "utf-8",
                        new DefaultFileRenamePolicy());

                String tag = multi.getParameter("tag");
                String des = multi.getParameter("description");

                Enumeration files = multi.getFileNames();

                String file = (String)files.nextElement();
                String originalName = multi.getOriginalFileName(file);
                String sha256 = Auth.sha256(
                        originalName + new SimpleDateFormat("yyyyMMddHmsS").format(new Date()));
                String newName = sha256 + originalName.substring(
                        originalName.lastIndexOf("."));

                File oldFile = new File(uploadPath + "/" + originalName);
                oldFile.renameTo(new File(
                        uploadPath + "/" + newName));

                structJsonObj.put("new", sha256);
                structJsonObj.put("tag", tag);
                structJsonObj.put("des", des);
                structJsonObj.put("url", "./img/" + newName);

                structJsonArray.add(new JSONObject(structJsonObj));
                String query = "insert into s20131517p (url, tag, description, id) values (?, ?, ?, ?)";

                try {
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, "./img/" + newName);
                    pstmt.setString(2, tag);
                    pstmt.setString(3, des);
                    pstmt.setString(4, sha256);

                    pstmt.executeUpdate();
                } catch (SQLException e) { e.printStackTrace(); }
                respJsonObj.put("data", structJsonArray);
                respJsonObj.put("status", 201);
            } catch (Exception e) {
                respJsonObj.put("status", 204);
            }

        } else {
            respJsonObj.put("status", 405);
        }
        resp.setContentType("application/x-json; charset=UTF-8");
        resp.getWriter().print(respJsonObj);
    }


    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        JSONObject respJsonObj = new JSONObject();
        JSONObject structJsonObj = new JSONObject();
        JSONArray structJsonArray = new JSONArray();

        Cookie[] cookies = req.getCookies();
        String rqsQuery = req.getParameter("q");
        String pathInfo = req.getPathInfo();
        if(rqsQuery == null && pathInfo == null) {
            respJsonObj.put("status", 204);
        }
        // token validate
        else if(isValidate(cookies)){
            if(pathInfo != null){
                try {
                    String query = "select * from s20131517p where id=?";
                    pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, req.getPathInfo().substring(1));

                    rs = pstmt.executeQuery();
                } catch (SQLException e) { respJsonObj.put("error", e.toString()); }

            } else {
                try {
                    String query = "select * from s20131517p where tag like ?";
                    pstmt = conn.prepareStatement(query);
                    String substring = "%"+ rqsQuery +"%";
                    pstmt.setString(1, substring);

                    rs = pstmt.executeQuery();
                } catch (SQLException e) { respJsonObj.put("error", e.toString()); }
            }

            try {
                while(rs.next()){
                    structJsonObj.put("url", rs.getString("url"));
                    structJsonObj.put("tag", rs.getString("tag"));
                    structJsonObj.put("des", rs.getString("description"));
                    structJsonObj.put("id", rs.getString("id"));
                    structJsonArray.add(new JSONObject(structJsonObj));
                }
            } catch (SQLException e){ respJsonObj.put("error", e.toString());}

            respJsonObj.put("data", structJsonArray);
            respJsonObj.put("status", 200);
        }
        else{
            respJsonObj.put("status", 405);
        }
        resp.setContentType("application/x-json; charset=UTF-8");
        resp.getWriter().print(respJsonObj);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Cookie[] cookies = req.getCookies();
        JSONObject respJsonObj = new JSONObject();

        String id = req.getParameter("id");
        String desc = req.getParameter("description");

        if(id == null) {
            respJsonObj.put("status", 204);
        } else if(isValidate(cookies)) {
            String query = "update s20131517p set description=? where id=?;";

            try {
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, desc);
                pstmt.setString(2, id);

                pstmt.executeUpdate();
                respJsonObj.put("status", 200);

            } catch (SQLException e) { e.printStackTrace(); }
        } else {
            respJsonObj.put("status", 405);
        }

        resp.setContentType("application/x-json; charset=UTF-8");
        resp.getWriter().print(respJsonObj);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Cookie[] cookies = req.getCookies();
        JSONObject respJsonObj = new JSONObject();

        String id = req.getParameter("id");

        if(id == null) {
            respJsonObj.put("status", 204);
        } else if(isValidate(cookies)) {
            String query = "delete from s20131517p where id=?;";

            try {
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, id);

                pstmt.executeUpdate();
                respJsonObj.put("status", 200);

            } catch (SQLException e) { e.printStackTrace(); }
        } else {
            respJsonObj.put("status", 405);
        }

        resp.setContentType("application/x-json; charset=UTF-8");
        resp.getWriter().print(respJsonObj);
    }

    public static boolean isValidate(Cookie[] cookies){
        String token = "";
        String id = "";
        try {
            for(Cookie c: cookies){
                if(c.getName().equals("token")) token = c.getValue();
                if(c.getName().equals("id")) id = c.getValue();
            }
        } catch (NullPointerException e) {
            token = null;
            id = null;
        }

        return Auth.sha256(Auth.secretKey + id).equals(token);
    }
}