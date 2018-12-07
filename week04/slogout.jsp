<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%!
    boolean isSessionOn(String str){
        if ((str==null) || str.equals("")){
            return false;
        }
        return true;
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>로그인 처리</title>
</head>
<body>
<% session.invalidate(); %>
<p>로그아웃 되었습니다.</p>
<p><a href="slogin.jsp">로그인</a></p>
</body>
</html>
