<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta charset="utf-8">
        <title>스크립트 구성 요소 테스트</title>
    </head>
    <body>
        <%! int j=10; %>
        <% int sum1=0; int sum2=1; %>
        <% for(int i=1; i<=j; i++) {
                sum1 += i;
                sum2 *= i;
            }
        %>
        1부터 <%=j%>까지의 합은 <%=sum1%>. <br/>
        1부터 <%=j%>까지의 곱은 <%=sum2%>. <br/>
    </body>
</html>
