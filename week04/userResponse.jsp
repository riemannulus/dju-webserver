<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
        </script>
        <link rel="stylesheet" type="text/css" href="login.css">
        <title>인스턴스 실습</title>
    </head>
    <body>
    Cache-Control 헤더값: <%= response.getHeader("Cache-Control") %> <br/>
    콘텐트타입: <%= response.getContentType() %> <br/>
    문자인코딩: <%= response.getCharacterEncoding() %><br/>
        <footer>
            <p>&copy; 20XX Made by Korea. All rights reserved.</p>
        </footer>
    </body>
</html>

