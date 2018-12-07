package project.servlet;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Calendar;

public class Auth extends HttpServlet {
    private static final long serialVersionUID = 1L;
    public static final String secretKey = "opnFvJNAIvkqzKUavQPdm6Jb24wKKq0C9orfGvOf3khn59hC5gtO9VIg0KnUqRJgOV4xpz1AnumXTVyEm8EO2S9NdDlyEduVxiuP40vxyQQbdQcMCjBPOzuYqW44tOMPycMsB3EwjMghjq3aGXc9eGyctfUS7rLu3hyClxW5uiMDcLcNO47kv2o6qIWMWB3iYNgook7jm9n10jU7qImBZTpTPuuehE6SHCOMPoxg0Igvul8e1YWrwDkpz3WN34mJ";

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
            conn = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/hdbwork?autoReconnect=true&validationQuery=select 1",
                    "hstud", "gkrtod123A!");
        }catch (SQLException e) { e.printStackTrace(); };
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("username");
        String passwd = req.getParameter("passwd");
        JSONObject jobj = new JSONObject();
        JSONArray jarray = new JSONArray();

        try {
            String query = "select * from 20131517u where passwd=password(?)";
            pstmt = conn.prepareStatement(query);
            pstmt.setString(1, passwd);
        }catch (SQLException e) { e.printStackTrace(); }

        try {
            rs = pstmt.executeQuery();
            while(rs.next()){
                if(rs.getString("username").equals(id)){
                    jobj.put("msg", "successful");
                    jobj.put("id", id);
                    resp.setHeader("Authorization", sha256(secretKey + id));
                    break;
                } else {
                    jobj.put("msg", "username or password is not valid");
                }
            }
        } catch (SQLException e) { jobj.put("error", e.toString()); }

        resp.setContentType("application/x-json charset=UTF-8");
        resp.getWriter().print(jobj);

        try {
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
        } catch (SQLException e2) {
            e2.printStackTrace();
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String id = req.getParameter("username");
        String passwd = req.getParameter("passwd");
        JSONObject jobj = new JSONObject();
        JSONArray jarray = new JSONArray();

        try {
            String query = "insert into 20131517u (username, passwd) values (?, password(?))";

            pstmt = conn.prepareStatement(query);

            pstmt.setString(1, id);
            pstmt.setString(2, passwd);
        }catch (SQLException e) { e.printStackTrace(); }

        try {
            pstmt.executeUpdate();
            jobj.put("msg", "registered successfully");
        } catch (SQLException e) { jobj.put("error", e.toString()); }

        resp.setContentType("application/x-json charset=UTF-8");
        resp.getWriter().print(jobj);

        try {
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
        } catch (SQLException e2) {
            e2.printStackTrace();
        }
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
    }

    public static String sha256(String msg) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            md.update(msg.getBytes());

            StringBuilder builder = new StringBuilder();
            for (byte b: md.digest()) {
                builder.append(String.format("%02x", b));
            }
            return builder.toString();
        } catch (NoSuchAlgorithmException e) { e.printStackTrace(); return "NoSuchAlgorithm";}

    }
}
