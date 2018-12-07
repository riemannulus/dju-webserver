<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
        </script>
        <link rel="stylesheet" type="text/css" href="login.css">
        <title>로그인 실습</title>
    </head>
    <body>
        <header>
            <h2>실습을 환영합니다</h2>
        </header>
        <nav>
            <ul>
                <li><a href="www.dju.ac.kr">로그인</a> </li>
                <li><a href="hive.dju.ac.kr">조회</a> </li>
            </ul>
        </nav>
        <section>
            <fieldset>
                <legend>로그인확인</legend>
                <label for="stud_user">아이디</label>
                <label class="id_form"><%=request.getParameter("stud_user")%></label><br/><br/>
                <label for="stud_passwd">암호명</label>
                <label class="id_form"><%=request.getParameter("stud_passwd")%></label><br/><br/>
            </fieldset>
        </section>
        <footer>
            <p>&copy; 20XX Made by Korea. All rights reserved.</p>
        </footer>
    </body>
</html>


