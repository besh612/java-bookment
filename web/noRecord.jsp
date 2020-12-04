<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>NoRecord</title>
</head>
<%
    String isLogin = (String) session.getAttribute("isLogin");
%>
<body>
<div style=" width: 100vw; height: 70vh; display: flex; justify-content: center; align-items: center;">
    <div class="ui basic segment center aligned">
        <div class="row center">
            <img class="ui centered" src="resources/img/book.svg" alt="no record" width="300">
            <div class="ui header big">
                저장된 북먼트가 없습니다. 지금 바로 추가해보세요!
            </div>
            <br>
            <div class="inline">
                <%
                    if (isLogin != null && isLogin.equals("true")) {
                        out.println("<div class=\"ui button\">북먼트 추가하기</div>");
                    } else {
                        out.println("<a href=\"signin.jsp\" class=\"ui button\">로그인 하기</a>");
                    }
                %>
            </div>
        </div>
    </div>
</div>
</body>
</html>