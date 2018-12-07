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
    if(!isSessionOn((String)session.getAttribute("sid"))
    || !isSessionOn((String)session.getAttribute("spasswd"))){
        out.println("<p> 로그인되지 않았습니다. </p>");
        out.println("<p> <a href=\"slogin.jsp\"> 로그인하기</a></p>");
        return;
    }
    else {
        out.println("<p> 환영합니다. " +
                (String)session.getAttribute("sid") + "님 - <a href=\"slogout.jsp\">로그아웃</a></p>");
        out.println("<p> 두번째 페이지로 이동합니다. " +
                (String)session.getAttribute("sid") + "님 - <a href=\"suser2.jsp\">이동</a></p>");
    }
%>
</body>
</html>
