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
    String stud_id = request.getParameter("stud_id");
    String stud_passwd = request.getParameter("stud_passwd");
    if(stud_id.equals("admin") && stud_passwd.equals("1234")) {
%>
<jsp:setProperty name="dto" property="stud_id"/>
<jsp:setProperty name="dto" property="verified" value="true"/>
<h3>로그인 되었습니다.</h3>
<a href="./secure.jsp">회원전용 페이지로</a>
<%
    } else {
%>
<h3>아이디 또는 패스워드가 정확하지 않습니다.</h3>
<a href="slogin.html">홈페이지로.</a>
<%
    }
%>
</body>
</html>
