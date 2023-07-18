<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
<meta charset="UTF-8">
<title>Login page</title>
<style>

	*{
		font-family: a타이틀고딕2;
	}

	body {
		background-color: aliceblue;
	}
	
	#container {
		width: 600px;
		margin: 10px auto;
		font-family: a타이틀고딕2;
	}
	
	fieldset {
		margin-bottom: 20px;
		background-color: white;
		border: 3px dashed rgb(253, 167, 167);
	}
	
	ul {
		list-style: none;
		padding-left: 0;
	}
	
	li {
		margin: 10px;
	}
	
	.li_label {
		width: 120px;
		line-height: 36px;
		float: left;
		font-weight: bold;
	}
	
	.txt_input {
		width: 300px;
		height: 30px;
		font-family: a타이틀고딕2;
		border: 1px solid rgb(253, 167, 167);
	}
	
	#buttons {
		width: 400px;
		margin: 20px auto;
		text-align: center;
	}
	
	.btn_input {
		width: 120px;
		height: 30px;
		font-size: 20px;
		font-family: a타이틀고딕2;
		margin: 10px;
		
	}
	#left_btn{
		margin-left: 150px;
	}

	input[required] {
		border: 1px solid rgb(76, 0, 255);
	}
	
	li label {
		font-style: italic;
		color: rgb(79, 62, 173);
	}
	
	input:checked+label {
		font-weight: bold;
	}
	
	#b_check{
		margin-left:10px;
		font-family: a타이틀고딕2;
	}
</style>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<body>
<%@ include file="jdbc_set.jsp" %>
<%
/* 	session.removeAttribute("id"); */
/* 	session.invalidate(); */

/* 	if(request.isRequestedSessionIdValid()){
		session.invalidate();
	}
 */
/* 	String uId = (String) session.getAttribute("id");
	out.println(uId); */
%>

	<form name="login" action="u_login2.jsp">
		<div id="container">
			<h1>💕로그인 해주세요~~</h1>
				<fieldset>
					<legend>로그인 정보</legend>
					<ul>
						<li>
							<label class="li_label" for="uid">아이디</label>
							<input class="txt_input" type="text" name="uId" required>
						</li>
						<li>
							<label class="li_label" for="pwd1">비밀번호</label>
							<input class="txt_input" type="password" name="pwd1" id="pwd1" required>
							<i class="fa fa-eye" id="eye-icon" style="color: #ccc" onclick="togglePasswordVisibility()"></i>
						</li>
					</ul>
					<div>
						<label><input type="radio" value="U" name="stat" checked>일반회원</label>
						<label><input type="radio" value="A" name="stat">관리자</label>
					</div>
					<button class="btn_input" id="left_btn" type="submit">로그인
					<button class="btn_input" onclick="isback()">홈페이지로</button>
				</fieldset>
			</form>
		</div>
</body>
</html>

<script>
function isback() {
	location.href = "home_main.jsp";
}

function togglePasswordVisibility() {
	var pwdInput = document.getElementById("pwd1");
	var eyeIcon = document.getElementById("eye-icon");

	if (pwdInput.type === "password") {
		pwdInput.type = "text";
		eyeIcon.classList.remove("fa-eye");
		eyeIcon.classList.add("fa-eye-slash");
	} else {
		pwdInput.type = "password";
		eyeIcon.classList.remove("fa-eye-slash");
		eyeIcon.classList.add("fa-eye");
	}
}
</script>