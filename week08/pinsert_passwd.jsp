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
    PreparedStatement select = null;
    PreparedStatement update = null;

    try {
        Class.forName("com.mysql.jdbc.Driver");
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }

    try {
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/hdbwork", "hstud", "gkrtod123A!");
        String sql = "select * from s20131517";
        String sql2 = "insert into s20131517 (stud_id, stud_passwd) values (?, ?);";

        update = conn.prepareStatement(sql2);
        update.setString(1, "suho");
        update.setString(2, "6444123");
        update.executeUpdate();

        select = conn.prepareStatement(sql);
        rs = select.executeQuery();

        while(rs.next()){
            out.println(rs.getString("stud_id"));
            out.println(rs.getString("stud_passwd"));
            out.println("\n");
        }
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        try {
            if(conn != null) conn.close();
            if(select != null) select.close();
            if(update != null) update.close();
            if(rs != null) rs.close();
        } catch (SQLException e2) {
            e2.printStackTrace();
        }
    }
%>
</body>
</html>