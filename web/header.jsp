<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Header</title>
</head>
<%
    String isLogin = (String) session.getAttribute("isLogin");
%>
<body>
<div class="ui tablet computer only padded grid">
    <div class="ui borderless top fixed fluid menu huge">
        <a href="index.jsp" class="header item">북먼트</a>
        <div class="right menu">
            <%
                if (isLogin != null && isLogin.equals("true")) {
                    out.println("<a href=\"logout.jsp\" class=\"item\">로그아웃</a>");
                } else {
                    out.println("<a href=\"signin.jsp\" class=\"item\">로그인</a>");
                }
            %>
        </div>
    </div>
</div>
</body>
</html>