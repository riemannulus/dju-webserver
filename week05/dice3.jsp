<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <jsp:useBean id="dice3" class="bean.user.Dice3">
    <jsp:setProperty name="dice3" property="startNum"/>
    <jsp:setProperty name="dice3" property="endNum"/>
    </jsp:useBean>
    <title>JavaBean Test </title>
  </head>
  <body>
      <h2>입력된 숫자 사이의 난수.</h2>
      난수 1: <jsp:getProperty name="dice3" property="numFirst" /> <br/>
      난수 2: <jsp:getProperty name="dice3" property="numSecond" /> <br/>
      <br/>
      최대값: <% System.out.println((dice3.getnumFirst() > dice3.getnumSecond()) ? dice3.getnumFirst() : dice3.getnumSecond());%>
      최소값: <% System.out.println((dice3.getnumFirst() > dice3.getnumSecond()) ? dice3.getnumSecond() : dice3.getnumFirst());%>
      <a href=dice2.html> 다시 숫자 입력하기. </a>
  </body>
</html>
