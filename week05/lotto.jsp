<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <title>JavaBean Test </title>
  </head>
  <body>
      <jsp:useBean id="lotto" class="bean.user.Lotto"/>
      <h1>This week's lotto number</h1>
      <h2><jsp:getProperty name="lotto" property="lottoNum"/></h2>
  </body>
</html>
