    <%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
            <% request.setCharacterEncoding("utf-8"); %>
        <!DOCTYPE html>
        <html>
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
        <script src="http://html5shiv.googlecode.com/svn/trunk/html5.js">
        </script>
        <link rel="stylesheet" type="text/css" href="login.css">
        <title>인스턴스 실습2</title>
        </head>
        <body>
        <%
                    int totalBuffer = out.getBufferSize();
                    int remainBuffer = out.getRemaining();
                    int bufferConsuming = totalBuffer-remainBuffer;
        %>
        <%
            out.println("전체 출력버퍼 크기: " + totalBuffer + "bytes <br/>");
            out.println("사용가능 출력버퍼 크기: " + remainBuffer + "bytes <br/>");
            out.println("사용중인 출력버퍼 크기: " + bufferConsuming + "bytes");
        %>
        <footer>
        <p>&copy; 20XX Made by Korea. All rights reserved.</p>
        </footer>
        </body>
        </html>