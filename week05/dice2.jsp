<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <jsp:useBean id="dice2" class="bean.user.Dice2">
    <jsp:setProperty name="dice2" property="startNum"/>
    <jsp:setProperty name="dice2" property="endNum"/>
    </jsp:useBean>
    <title>JavaBean Test </title>
  </head>
  <body>
      <h2>입력된 숫자 사이의 난수.</h2>
      숫자 1: <jsp:getProperty name="dice2" property="startNum" /> <br/>
      숫자 2: <jsp:getProperty name="dice2" property="endNum" /> <br/>
      난수: <jsp:getProperty name="dice2" property="num" /> <br/>
      <a href=dice2.html> 다시 숫자 입력하기. </a>
  </body>
</html>
