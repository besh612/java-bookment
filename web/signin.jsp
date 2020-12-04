<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0">
    <script
            src="https://kit.fontawesome.com/64d58efce2.js"
            crossorigin="anonymous"
    ></script>
    <link rel="stylesheet" type="text/css"
          href="${pageContext.servletContext.contextPath}/resources/signin-style.css"/>
    <title>북먼트</title>
</head>
<body>
<div class="container">
    <div class="forms-container">
        <div class="signin-signup">
            <form action="signinProcess.jsp" class="sign-in-form" method="post">
                <h2 class="title">로그인</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input name="username" type="text" placeholder="Username"/>
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input name="password" type="password" placeholder="Password"/>
                </div>
                <input type="submit" value="로그인" class="btn solid"/>
            </form>
            <form name="newAccount" action="signupProcess.jsp" class="sign-up-form" method="post">
                <h2 class="title">회원가입</h2>
                <div class="input-field">
                    <i class="fas fa-user"></i>
                    <input id="username_input" name="username" type="text" placeholder="Username"/>
                </div>
                <div class="input-field">
                    <i class="fas fa-envelope"></i>
                    <input id="email_input" name="email" type="email" placeholder="Email"/>
                </div>
                <div class="input-field">
                    <i class="fas fa-lock"></i>
                    <input id="password_input" name="password" type="password" placeholder="Password"/>
                </div>
                <input type="submit" class="btn" value="가입하기" onclick="return CheckSignUp()"/>
            </form>
        </div>
    </div>

    <div class="panels-container">
        <div class="panel left-panel">
            <div class="content">
                <h3>처음 오셨나요?</h3>
                <p>
                    지금 당장 북먼트에 가입해 독서기록을 저장해보세요!
                </p>
                <button class="btn transparent" id="sign-up-btn">
                    회원가입
                </button>
            </div>
            <img src="resources/img/book2.svg" class="image" alt=""/>
        </div>
        <div class="panel right-panel">
            <div class="content">
                <h3>안녕하세요!</h3>
                <p>
                    지금 당장 북먼트에 가입해 독서기록을 저장해보세요!
                </p>
                <button class="btn transparent" id="sign-in-btn">
                    로그인
                </button>
            </div>
            <img src="resources/img/register.svg" class="image" alt=""/>
        </div>
    </div>
</div>
<script type="text/javascript" src="resources/js/validation.js"></script>
<script>
  const sign_in_btn = document.querySelector("#sign-in-btn");
  const sign_up_btn = document.querySelector("#sign-up-btn");
  const container = document.querySelector(".container");

  sign_up_btn.addEventListener("click", () => {
    container.classList.add("sign-up-mode");
  });

  sign_in_btn.addEventListener("click", () => {
    container.classList.remove("sign-up-mode");
  });
</script>
</body>
</html>
