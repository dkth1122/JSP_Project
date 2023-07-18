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
	<button onclick="qna()">문의 확인</button>
	<button onclick="mem()">멤버쉽 관리</button>
	<button onclick="isback()">로그아웃</button>
</body>
</html>
<script>
	function go() {
		location.href = "a_admin.jsp"
	}
	function qna() {
		location.href = "a_admin2.jsp"
	}
	function mem() {
		location.href = "a_mem.jsp"
	}
	function isback() {
		location.href = "home_main.jsp"
	}
</script>