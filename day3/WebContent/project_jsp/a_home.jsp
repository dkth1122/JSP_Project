<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<button onclick="go()">고객 관리</button>
	<button onclick="qna()">게시판</button>
	<button onclick="isback()">돌아가기 버튼</button>
</body>
</html>
<script>
	function go() {
		location.href = "a_admin.jsp"
	}
	function qna() {
		location.href = "a_admin2.jsp"
	}
	function isback() {
		location.href = "home_main_login.jsp"
	}
</script>