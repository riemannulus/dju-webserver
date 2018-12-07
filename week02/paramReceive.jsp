<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>forward+param</title>
    </head>
    <body>
        <section>
            <fieldset><legend>forward + param check </legend>
                <label for="userid">id</label>
                <label class="id_form"><%=request.getParameter("userid")%></label><br/><br/>
                <label for="passwd">passwd</label>
                <label class="id_form"><%=request.getParameter("passwd")%></label><br/><br/>
            </fieldset>
        </section>
    </body>
</html>

