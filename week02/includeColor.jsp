<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="colorValue.jspf"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <title>include directive 예제</title>
    </head>
    <body bgcolor="<%=bodyBG_color%>">
        안녕하세요 다른 파일에서 값을 가져오는 include 예제파일 includeColor.jsp입니다.<br />
        <input id="name" type="text" placeholder="홍길동" required> <br />
        <input type="submit" value="보내기">
    </body>
</html>

