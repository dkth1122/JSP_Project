<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = (String)session.getAttribute("id");
	session.setAttribute("id", id);
%>
	<h1>마이페이지</h1>
	<div>장바구니 - sh_basket DB 사용</div>
	<div>관심상품 - 구현 제외</div>
	<div>구매내역 - 다른 DB 사용 a태그로 연결</div>
	<div>주문/배송 조회 - 다른 DB 사용 a태그로 연결</div>
	<div>후원 내역 - 후원 DB 사용 + 후원 소식도 넣기</div>
	<div>멤버쉽 내역 - 멤버십 DB 사용</div>
	<div>회원 정보 수정 - user 테이블 사용 </div>
	<div>탈퇴 - user ? </div>
	<div>문의 하기 </div>
	<button onclick="QnA()">문의</button>
</body>
</html>
<script>
	function QnA() {
		location.href = "u_QnA.jsp"
	}
</script>	