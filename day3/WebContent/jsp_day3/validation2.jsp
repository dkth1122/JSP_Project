<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form name="login" action="success.jsp">
        <div> 아이디 : <input type="text" name="id"></div>
        <div> 비밀번호 : <input type="password" name="pwd"></div>
        <input type="button" value="전송" onclick="check();">
    </form>
</body>
</html>
<script>
	// 아이디는 영어 대소문자만 입력 가능하도록 설정
	// 숫자, 특수문자, 한글 등이 입력된 상태로 전송 시 '영어 대소문자만 가능' 알림
	// 패스워드는 숫자만 가능하도록, 그렇지 않을 시 '패스워드는 숫자만 가능' 알림

	function check() {
		var login = document.login;

		var a = /^[a-zA-Z]*$/;
		var b = /^[0-9]*$/;
		
		if (!a.test(login.id.value)) {
			alert('아이디는 영어 대소문자만 입력 가능합니다.');
			login.id.focus();
			return;
		}
		
		if (!b.test(login.pwd.value)) {
			alert('패스워드는 숫자만 입력 가능합니다.');
			login.pwd.focus();
			return;
		}
		
		login.submit();
	}
</script>
