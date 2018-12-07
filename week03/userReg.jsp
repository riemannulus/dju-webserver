<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@ page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
        <link rel="stylesheet" type="text/css" href="login.css">
        <title>로그인 실습</title>
    </head>
    <body>
        <header>
            <h2>실습을 환영합니다.</h2>
        </header>
        <nav>
            <ul>
                <li><a href="www.dju.ac.kr">로그인</a></li>
                <li><a href="hive.dju.ac.kr">조회</a></li>
            </ul>
        </nav>
        <section>
            <fieldset><legend>회원정보</legend>
                <fieldset> <legend>이름/이메일</legend>
                    <label for="stud_name">이름</label>
                    <label class="id_form"><%=request.getParameter("stud_name")%></label><br/>
                    <label for="stud_email">이메일</label>
                    <label class="id_form"><%=request.getParameter("stud_email")%></label><br/>
                    <label for="stud_phone">전화번호</label>
                    <label class="id_form"><%=request.getParameter("stud_phone")%></label><br/>
                </fieldset>
                <fieldset><legend>아이디/비밀번호</legend>
                    <label for="stud_id">아이디</label>
                    <label class="id_form"><%=request.getParameter("stud_id")%></label><br/>
                    <label for="stud_passwd">비밀번호</label>
                    <label class="id_form"><%=request.getParameter("stud_passwd")%></label><br/>
                </fieldset>
                <fieldset><legend>성별</legend>
                    <label class="id_form"><%=request.getParameter("stud_gender")%></label><br/>
                </fieldset>
                <fieldset><legend>취미</legend>
                    <% 
                    ArrayList<String> myArrayList = new ArrayList<String>();
                    for(int i = 0; i < 3; i ++){
                        String tmpType = request.getParameter("stud_hobby" + (i+1));
                        if(tmpType != null && !"".equals(tmpType))
                        myArrayList.add(tmpType);
                    }
                    for(int i = 0; i < myArrayList.size(); i++){
                        out.println("취미" + (i+1) + " = " +myArrayList.get(i) + "<br/>");
                    }
                    %>
                </fieldset>
            </fieldset>
        </section>
        <footer>
            <p>&copy; 20XX Made by Korea. All rights reserved.</p>
        </footer>
    </body>

</html>
