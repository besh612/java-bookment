<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <title>북먼트</title>
    <link rel="stylesheet"
          href="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.css">
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/resources/style.css">
</head>
<body id="root">
<jsp:include page="header.jsp"/>
<div class="ui padded grid">
    <jsp:include page="sidebar.jsp"/>
    <div
            class="sixteen wide mobile thirteen wide tablet thirteen wide computer right floated column"
            id="content"
    >
        <jsp:include page="main.jsp"/>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script>
  $(document).ready(function () {
    $(".ui.toggle.button").click(function () {
      $(".mobile.only.grid .ui.vertical.menu").toggle(100);
    });
  });
</script>
</body>
</html>
