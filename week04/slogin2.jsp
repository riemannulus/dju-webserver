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
<%
    if(!isSessionOn(request.getParameter("user_id"))
    || !isSessionOn(request.getParameter("user_passwd"))){
        out.println("<p> 정확히 입력하세요 </p>");
        out.println("<p> <a href=\"slogin.html\"> 로그인하기</a></p>");
        return;
    }

    String userId="admin";
    String userPassword="admin";

    if(request.getParameter("user_id").equals(userId) &&
    request.getParameter("user_passwd").equals(userPassword)){
        out.println("<p> 로그인 성공 </p>");
        out.println("<p> <a href=\"suser1.jsp\">회원 페이지1</a></p>");
        session.setAttribute("sid", request.getParameter("user_id"));
        session.setAttribute("spasswd", request.getParameter("user_passwd"));
    }
    else{
        out.println("<p> 로그인 실패</p>");
        out.println("<p> <a href=\"slogin.html\">로그인하기</a></p>");
    }
%>
</body>
</html>
