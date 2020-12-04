<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="bookment.repository.RemarkRepository" %>
<%@ page import="bookment.repository.RemarkRepository" %>
<%@ page import="bookment.dto.Remark" %>
<%@ page errorPage="execption/exceptionNoServer.jsp" %>
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
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    String id = request.getParameter("id");

    RemarkRepository manager = RemarkRepository.getInstance();
    Remark data = manager.getContent(id);
%>
<body>
<jsp:include page="header.jsp"/>
<div class="ui padded grid">
    <jsp:include page="sidebar.jsp"/>
    <div
            class="sixteen wide mobile thirteen wide tablet thirteen wide computer right floated column"
            id="content"
    >
        <div class="ui padded grid">
            <div class="ui clearing basic segment" style="margin-bottom: 0">
                <h1 class="ui huge left floated header"><%=data.getName()%>
                </h1>
                <span><a id="del_btn" class="ui red button right floated" style="margin: 10px 5px">삭제</a></span>
                <span><a id="edit_btn" class="ui button right floated" style="margin: 10px 5px">수정</a></span>
            </div>
            <div class="ui divider" style="width: 100%"></div>
            <div class="ui basic segment">
                <div class="ui grid centered">
                    <div class="four wide column">
                        <div class="ui cards">
                            <div class="card">
                                <div class="image">
                                    <img id="book_cover" class="ui mini"
                                         src="<%=data.getCover()%>"
                                         alt="">
                                </div>
                                <div class="content">
                                    <div id="book_name" class="header"><%=data.getName()%>
                                    </div>
                                    <div class="meta"><a id="book_author"><%=data.getAuthor()%>
                                    </a></div>
                                    <br>
                                    <div class="ui huge star rating middle aligned"
                                         data-rating="<%=data.getRating()%>"
                                         data-max-rating="5"></div>
                                </div>
                                <div class="extra">
                                    <span class="right floated"><%=dateFormat
                                            .format(data.getDate())%></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="ten wide column">
                        <div class="ui form">
                            <h2>북먼트</h2>
                            <div class="field">
                                <p style="font-size: 1.3em; white-space:pre-wrap;"><%=data.getContent()%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <jsp:include page="footer.jsp"/>
    </div>
    <div id="del_modal" class="ui tiny basic modal">
        <div class="ui icon header">
            <i class="trash icon"></i>
            경고!
        </div>
        <div class="content">
            <p>정말로 기록을 삭제하시겠습니까?</p>
        </div>
        <div class="actions">
            <div class="ui red basic cancel inverted button">
                <i class="remove icon"></i>
                취소
            </div>
            <div onclick="deleteById(<%=id%>)" class="ui green ok inverted button">
                <i class="checkmark icon"></i>
                삭제
            </div>
        </div>
    </div>
    <div id="edit_modal" class="ui modal">
        <div class="header">수정</div>
        <div id="book_box" class="description">
            <div class="ui grid centered">
                <div class="four wide column">
                    <div class="ui cards">
                        <div class="card">
                            <div class="image">
                                <img class="ui mini"
                                     src="<%=data.getCover()%>"
                                     alt="">
                            </div>
                            <div class="content">
                                <div class="header"><%=data.getName()%>
                                </div>
                                <div class="meta"><a><%=data.getAuthor()%>
                                </a></div>
                                <br>
                                <div class="ui huge star rating middle aligned"
                                     data-rating="<%=data.getRating()%>"
                                     data-max-rating="5"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ten wide column">
                    <div class="ui form">
                        <div class="field">
                            <textarea id="text_field" style="width: 100%; height: 100%"><%=data.getContent()%></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="actions">
            <div class="ui black deny button">
                취소
            </div>
            <div class="ui positive right labeled icon button" onclick="modifyById(<%=id%>)">
                저장
                <i class="checkmark icon"></i>
            </div>
        </div>
    </div>
</div>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script>
  let book_score = 0;
  $('.rating').rating();
  $(document).ready(function () {
    $("#edit_btn").click(function () {
      $("#edit_modal")
      .modal('show')
      ;
    });$("#del_btn").click(function () {
      $("#del_modal")
      .modal('show')
      ;
    });
    $('.rating').rating({
      onRate: function (value) {
        book_score = value;
      },
    });
  });
  function modifyById(id) {
    if ($('#text_field').val() == 0) {
      alert("소감을 입력하세요.");
      return;
    }
    const write = {
      'content': $('#text_field').val(),
      'rating': book_score,
    };
    $.ajax({
      url: "${pageContext.request.contextPath}/book?cmd=modify&id=" + id,
      type: 'post',
      contentType: "application/json; charset=utf-8",
      dataType: "text",
      data: JSON.stringify(write),
      error: function (request, status, error) {
        alert(
            "code:" + request.status + "\n" + "message:" + request.responseText + "\n"
            + "error:"
            + error);
      }
    }).done(function (result) {
      alert("저장 성공");
      location.reload();
    })
  }
  function deleteById(id) {
    $.ajax({
      url: "${pageContext.request.contextPath}/book?cmd=delete&id=" + id,
      type: 'post',
      dataType: "text",
      error: function (request, status, error) {
        alert(
            "code:" + request.status + "\n" + "message:" + request.responseText + "\n"
            + "error:"
            + error);
      }
    }).done(function (result) {
      if(result==1){
        alert("삭제 성공");
        location.href="index.jsp";
      }else{
        alert("삭제 실패");
      }
    })
  }
</script>
</body>
</html>
