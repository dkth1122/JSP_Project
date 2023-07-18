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
			String uId = (String)session.getAttribute("uId");
			session.setAttribute("uId", uId);
	
			out.println(uId);

		%>
			<h1>마이페이지</h1>
			<div>장바구니 - sh_basket DB 사용</div>
			<div>관심상품 - 구현 제외</div>
			<div>구매내역 - 다른 DB 사용 a태그로 연결</div>
			<div>주문/배송 조회 - 다른 DB 사용 a태그로 연결</div>
			<div>후원 내역 - 후원 DB 사용 + 후원 소식도 넣기</div>
			<div>멤버쉽 내역 - 멤버십 DB 사용</div>
			
			<div>회원 정보 수정 - user 테이블 사용 </div>
			<input type="button"  onclick="MI()" value="회원 정보 수정">
			
			<div>탈퇴 -user 테이블의 secession</div>
			<input type="button"  onclick="SC()"value="탈퇴 요청">
			
			<div>문의 하기 </div>
			<input type="button" onclick="QnA()" value="문의">

			<div>멤버쉽</div>
			<input type="button" onclick="mem()" value="이동">
			
			<div>돌아가기</div>
			<div><input type="button" onclick="isback()" value="돌아가기" ></div>	
			
		</body>
		</html>
		<script>
			 var uId = '<%= session.getAttribute("uId") %>';
		 
			function QnA() {
				location.href = "u_QnA.jsp"
			}
			 function SC() {
			        if (confirm("정말로 탈퇴하시겠습니까?")) {
			            location.href = "u_secession.jsp";
			        }
			    }
			function MI() {
				window.open("u_Modify_info.jsp?uId="+ uId,"umpop","wuIdth=500, height=300");
			}
			function isback() {
				location.href = "home_main_login.jsp";
			}
			function mem() {
				location.href = "u_Membership.jsp";
			}
		</script>	