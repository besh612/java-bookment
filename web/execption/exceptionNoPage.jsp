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
<jsp:include page="../header.jsp"/>
<div class="ui padded grid">
    <jsp:include page="../sidebar.jsp"/>
    <div
            class="sixteen wide mobile thirteen wide tablet thirteen wide computer right floated column"
            id="content"
    >
        <div class="ui padded grid">
            <div class="ui clearing basic segment">
                <h1 class="ui huge left floated header">Error!</h1>
            </div>
            <div class="ui divider" style="width: 100%"></div>
            <div style=" width: 100vw; height: 70vh; display: flex; justify-content: center; align-items: center;">
                <div class="ui basic segment center aligned">
                    <div class="row center">
                        <img class="ui centered"
                             src="${pageContext.servletContext.contextPath}/resources/img/404.svg"
                             alt="404" width="300">
                        <div class="ui header big">
                            이런! 페이지가 없습니다.
                        </div>
                        <br>
                        <div class="inline">
                            <a href="javascript:window.history.back();" class="ui button">뒤로가기</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="../footer.jsp"/>
    </div>
</div>
</body>
</html>
