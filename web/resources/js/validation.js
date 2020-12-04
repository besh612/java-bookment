function CheckSignUp() {
  const userName = document.getElementById("username_input");
  const email = document.getElementById("email_input");
  const password = document.getElementById("password_input");

  if (!check(/^[a-z0-9]+$/, userName, "아이디는 영문 소문자, 숫자만 가능합니다."))
    return false;

  if (userName.value.length < 4 || userName.value.length > 10) {
    alert("최소 4자부터 10자까지의 아이디를 설정하세요.")
    userName.select();
    userName.focus();
    return false;
  }

  if (!check(/^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/, email, "정확한 메일 주소를 입력해주세요."))
    return false;

  if (!check(/^[a-zA-Z0-9]+$/, password, "비밀번호는 영문, 숫자 조합만 가능합니다."))
    return false;

  if (password.value.length < 8 || password.value.length > 20) {
    alert("최소 8자부터 20자까지의 비밀번호를 설정하세요.")
    password.select();
    password.focus();
    return false;
  }

  function check(regExp, e, msg) {
    if (regExp.test(e.value)) {
      return true;
    }
    alert(msg);
    e.select();
    e.focus();
    return false;
  }
  document.newAccount.submit();
}