<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
        <meta charset="utf-8">
        <title>sciprt method</title>
    </head>
    <body>
        <h2>Method 선언과 사용</h2>
        <%! String id; %>
        <%! public void setId(String id) {
                this.id = id;
            }
        %>
        <%! public String getId() {
                return id;
            }
        %>
        id변수 설정: kdhong <%setId("kdhong");%> <br/>
        id변수 : <%=id%><br/>
        메소드 실행결과: <%=getId()%><br />
    </body>
</html>
