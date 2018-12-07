<%@ page import="java.sql.*" %>
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
    Connection conn = null;
    ResultSet rs = null;
    PreparedStatement pstmt = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hdbwork", "hstud", "gkrtod123A!");
        String sql = "select * from s20131517 where stud_id=?;";
        pstmt = conn.prepareStatement(sql);
        pstmt.setString(1, "suho");
        rs = pstmt.executeQuery();
        while(rs.next()){
            out.println(rs.getString("stud_id"));
            out.println(rs.getString("stud_passwd"));
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if(conn != null) conn.close();
            if(pstmt != null) pstmt.close();
            if(rs != null) rs.close();
        } catch (SQLException e2) {
            e2.printStackTrace();
        }
    }
%>
</body>
</html>