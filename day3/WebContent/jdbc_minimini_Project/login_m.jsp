<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
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
		width: 100px;
		height: 30px;
		font-size: 20px;
		font-family: a타이틀고딕2;
		margin-left: 220px;
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
</head>
<body>
<%@ include file="../jsp_day3/jdbc_set.jsp" %>
<%
/* 	session.removeAttribute("id"); */
/* 	session.invalidate(); */

	if(request.isRequestedSessionIdValid()){
		session.invalidate();
	}

/* 	String uId = (String) session.getAttribute("id");
	out.println(uId); */
%>

	<form name="login" action="login.jsp">
		<div id="container">
				<h1>💕로그인 해주세요~~</h1>
				<form name="list" action="insert.jsp">
					<fieldset>
						<legend>로그인 정보</legend>
						<ul>
							<li><label class="li_label" for="uid">아이디</label> 
							<input class="txt_input" type="text" name="uid" required></li>
							
							<li><label class="li_label" for="pwd1">비밀번호</label> 
							<input class="txt_input" type="password" name="pwd1" required></li>
						</ul>
						<div>
						<label><input type="radio" value="U" name="stat" checked>일반회원</label>
						<label><input type="radio" value="A" name="stat">관리자</label>
						</div>
						<div><button class="btn_input"  type="submit" >로그인</div>
					</fieldset>
			</div>
</body>
</html>