<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="bookment.repository.RemarkRepository" %>
<%@ page import="java.util.List" %>
<%@ page import="bookment.dto.Remark" %>
<%@ page import="java.util.Collections" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Main</title>
</head>
<%
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm");
    String id = (String) session.getAttribute("id");
    String isLogin = (String) session.getAttribute("isLogin");

    RemarkRepository manager = RemarkRepository.getInstance();
    List<Remark> list = manager.getList(id);
%>
<body>
<div class="ui padded grid">
    <div class="ui clearing basic segment">
        <h1 class="ui huge left floated header">Dashboard</h1>
        <span>
            <%
                if (isLogin != null && isLogin.equals("true")) {
                    out.println(
                            "<a id=\"add_btn\" class=\"ui button right floated\" style=\"margin: 10px 5px\">기록 추가</a>");
                }
            %>
        </span>
    </div>
    <div id="card_box" class="ui link cards doubling eight divider" style="height: 10%">
        <%
            if (list == null || list.size() == 0) {
        %>
        <jsp:include page="noRecord.jsp"/>
        <%
        } else {
            Collections.reverse(list);
            for (Remark r : list) {
        %>
        <div class="card" OnClick="location.href ='./bookment.jsp?id=<%=r.getId()%>'"
             style="cursor:pointer;">
            <div class="image">
                <img src="<%=r.getCover()%>" alt="사진">
            </div>
            <div class="content">
                <div class="header"><%=r.getName()%>
                </div>
                <div class="meta">
                    <a><%=r.getAuthor()%>
                    </a>
                </div>
                <br>
                <div class="ui huge star rating" data-rating="<%=r.getRating()%>"
                     data-max-rating="5"></div>
            </div>
            <div class="extra">
                <span class="right floated"><%=dateFormat.format(r.getDate())%></span>
            </div>
        </div>
        <%
                }
            }
        %>
        <jsp:include page="footer.jsp"/>
    </div>
    <div class="ui modal">
        <div class="ui basic segment grid">
            <div class="three column row">
                <div class="left floated column">
                    <h1>기록추가</h1>
                </div>
                <div class="right floated column">
                    <div class="ui action left icon input">
                        <i class="search icon"></i>
                        <input id="isbn" type="text" placeholder="ISBN 도서 검색">
                        <div id="search_isbn" class="ui teal button">검색</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="ui divider" style="width: 100%"></div>
        <div id="book_box" class="description">
            <div class="ui grid centered">
                <div class="four wide column">
                    <div class="ui cards">
                        <div class="card">
                            <div class="image">
                                <img id="book_cover" class="ui mini"
                                     src=""
                                     alt="">
                            </div>
                            <div class="content">
                                <div id="book_name" class="header"></div>
                                <div class="meta"><a id="book_author"></a></div>
                                <br>
                                <div class="ui huge star rating middle aligned"
                                     data-max-rating="5"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="ten wide column">
                    <div class="ui form">
                        <div class="field">
                            <textarea id="text_field" style="width: 100%; height: 100%"></textarea>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="actions">
            <div class="ui black deny button">
                취소
            </div>
            <div id="btn_save" class="ui positive right labeled icon button">
                저장
                <i class="checkmark icon"></i>
            </div>
        </div>
    </div>
</div>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js"></script>
<script>
  $('.rating').rating();
  $(document).ready(function () {
    let data = null;
    let book_score = 0;
    $('.rating').rating({
      onRate: function (value) {
        book_score = value;
      },
    });
    $("#book_box").hide();
    $("#add_btn").click(function () {
      $('.ui.modal')
      .modal('show')
      ;
    });
    $('#search_isbn').click(function () {
      if ($('#isbn').val() == 0) {
        alert("검색어를 입력하세요");
        return;
      }
      const query = {'query': $('#isbn').val(), 'target': "isbn"};
      $.ajax({
        url: 'https://dapi.kakao.com/v3/search/book',
        type: 'get',
        dataType: 'json',
        headers: {'Authorization': 'YOUR_KAKAO_API_KEY'},
        data: query,
        error: function (request, status, error) {
          alert(
              "code:" + request.status + "\n" + "message:" + request.responseText + "\n" + "error:"
              + error);
        }
      }).done(function (res) {
        alert("검색 성공");
        data = res['documents'][0];
        $("#book_cover").attr("src", res["documents"][0]["thumbnail"]);
        $("#book_name").text(res["documents"][0]["title"])
        $("#book_author").text(res["documents"][0]["authors"][0])
        $("#book_box").show();
      });
    });

    $('#btn_save').click(function () {
      if ($('#text_field').val() == 0) {
        alert("소감을 입력하세요.");
        return;
      }
      const write = {
        'name': data['title'],
        'isbn': data['isbn'],
        'content': $('#text_field').val(),
        'rating': book_score,
        'cover': data['thumbnail'],
        'author': data['authors'][0],
      };
      $.ajax({
        url: "${pageContext.request.contextPath}/book?cmd=write",
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
    });

  });
</script>
</html>
