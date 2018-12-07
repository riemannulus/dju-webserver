package project.servlet;

import org.json.simple.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Validate extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        Cookie[] cookies = req.getCookies();

        JSONObject respJsonObj = new JSONObject();

        if(api.isValidate(cookies)){
            respJsonObj.put("status", 200);
        } else {
            respJsonObj.put("status", 405);
        }

        resp.getWriter().print(respJsonObj);
    }
}
