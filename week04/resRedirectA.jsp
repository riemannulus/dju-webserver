    <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
            <% request.setCharacterEncoding("utf-8"); %>
        <!DOCTYPE html>
        <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
        </script>
        <link rel="stylesheet" type="text/css" href="login.css">
        <title>인스턴스 실습2</title>
        </head>
        <body>
            현재 페이지는 res_redirectA.jsp입니다<br/>
            하지만, res_redirectB.jsp로 제어 이동(redirect) 합니다.
            <% response.sendRedirect("resRedirectB.jsp"); %>
        <footer>
        <p>&copy; 20XX Made by Korea. All rights reserved.</p>
        </footer>
        </body>
        </html>
