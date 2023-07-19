
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	 @font-face {
        font-family: "삼립호빵";
        src: url("./img/SDSamliphopangcheTTFOutline.ttf") format("truetype");
    }
    
    @font-face {
        font-family: "a타이틀고딕2";
        src: url("./img/A타이틀고딕2.TTF") format("truetype");
    }

	*{
		font-family: a타이틀고딕2;
	}

	body {
		margin: 0px 0px;
		background-color: #fdfdd3;
	}
	
	#container {
		width: 600px;
		margin: 10px auto;
	}
	

    img{
        width: 400px;
    }

	.c_1{
		position: absolute;
        top : 3%;
        left: 38%;
	}
	
	fieldset {
        width: 500px;
        height: 400px;
        margin: 0px auto;
        margin-top: 440px;
        margin-bottom: 32px;
		background-color: white;
        border: 3px dashed pink;
        border-radius: 50px;
	}
	
	.f-1{
		 text-align: center;
		 margin:32px auto;
	}
	
	#f-d
	{
		font-family: "삼립호빵";
		color:rgb(255, 99, 146);
		font-size: 32px;
	}
	
	ul {
		list-style: none;
		padding-left: 0;
	}
	
	li {
		text-align: center;
	}
	
	.btn_input {
		width: 150px;
	  	height: 36px;
		font-size: 15px;
		font-family: a타이틀고딕2;
		color:rgb(255, 99, 146);
		border-radius: 30px;
		border:1px solid pink;
		background-color: #fdfdd3;
		margin: 10px auto;
		cursor: pointer;
	}

	
	input:focus { 
		outline: none !important; border-bottom-color: pink; box-shadow: 0 0 10px #d6a8e9; 
		}
	
	#gam:hover {
	cursor: pointer;
	}
</style>
</head>
<body>
	<%
			String uId = (String)session.getAttribute("uId");
			session.setAttribute("uId", uId);

		%>
		<div class="c_1">
		  <img id="gam" onclick="isback()" src = "./img/kp5-removebg-preview.png">
		</div>
<fieldset>
	<ul>
		<div class="f-1">
			<li><div id="f-d">마이페이지</div></li>
		</div>
			<li>
				<input class="btn_input" type="button" onclick="MI()" value="회원 정보 수정">
			</li>
			<li>
				<input class="btn_input" type="button" onclick="mem()" value="멤버쉽 관리하기">
			</li>
			<li>
				<input class="btn_input" type="button" onclick="QnA()" value="1:1 문의하기">
			</li>
			<li>
				<input class="btn_input" type="button" onclick="SC()" value="회원 탈퇴 신청">
			</li>
			<li>
				<input class="btn_input"  type="button" onclick="isback()" value="돌아가기">
			</li>
		</ul>
</fieldset>
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
		var left = (screen.width - 325) / 2;
		var top = (screen.height - 280) / 2;
		window.open("u_Modify_info.jsp?uId="+ uId, "umpop", "width=370, height=400, top=" + top + ", left=" + left);
	}
	
	function isback() {
				location.href = "home_main_login.jsp";
	}
	
	function mem() {
				location.href = "u_Membership.jsp";
	}
		</script>
