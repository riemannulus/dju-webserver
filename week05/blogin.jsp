<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <jsp:useBean id="mlogin" class="bean.user.Login">
        <jsp:setProperty name="mlogin" property="userName"/>
    </jsp:useBean>
    <title>JavaBean Test </title>
  </head>
  <body>
      <jsp:getProperty name="mlogin" property="userName"/>
  </body>
</html>
