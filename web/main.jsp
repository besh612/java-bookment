<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Main</title>
</head>
<body>
<div class="ui padded grid">
    <div class="ui clearing basic segment">
        <h1 class="ui huge left floated header">Dashboard</h1>
        <span><a class="ui button right floated" style="margin: 10px 5px">기록 추가</a></span>
    </div>
    <%--    <jsp:include page="noRecord.jsp"/>--%>
    <div class="ui link cards doubling eight divider">
        <div class="card" OnClick="location.href ='./bookment.jsp?id=123'" style="cursor:pointer;">
            <div class="image">
                <img src="https://search1.kakaocdn.net/thumb/R120x174.q85/?fname=http%3A%2F%2Ft1.daumcdn.net%2Flbook%2Fimage%2F5515594%3Ftimestamp%3D20201125150439"
                     alt="사진">
            </div>
            <div class="content">
                <div class="header">인생은 소설이다</div>
                <div class="meta">
                    <a>기욤뮈소</a>
                </div>
                <div class="description">
                    호도독후도독
                </div>
            </div>
            <div class="extra">
                <div class="ui star rating"></div>
                <span class="right floated">2020-11-25</span>
            </div>
        </div>
    </div>
</div>
</body>
<script>
  $(document)
  .ready(function () {
    $('.ui.rating')
    .rating();
  });
</script>
</html>
