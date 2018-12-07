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
  <%
    boolean flag = dto.isVerified();
    String namex = dto.getStud_id();
    if(flag){
        dto.setVerified(false);
        out.println(namex + "님 로그아웃 되었습니다.");
  %>
    <a href="slogin.html">로그인페이지.</a>
  <%
    } else {
  %>
    <h3> 로그인을 해야 합니다.</h3>
    <a href="slogin.html">로그인페이지</a>
  <%
    }
  %>
  </body>
</html>
