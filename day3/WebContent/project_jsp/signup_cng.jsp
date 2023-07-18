<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		font-family: a타이틀고딕2;
		font-size: 24px;
	}

	body{
		background-color: aliceblue; 
	}
	
	#container{
		width : 500px;
		height: 300px; 
		line-height: 60px;
		margin: 100px auto;
		background-color: white;
		border: 3px dashed rgb(253, 167, 167);
		text-align: center;
	}
	
</style>
</head>
<body>
<div id="container">
	<h1>💕 로그인 성공 !</h1>
	<%
		String uId = (String)session.getAttribute("uId");
		String uname = (String)session.getAttribute("uname");
		out.println(uname + "님 회원가입을 축하드려요!");	
		out.println(uId + "님 회원가입을 축하드려요!");
	%>
	<div><input type="button" onclick="isback()" value="홈페이지로" style="font-family: a타이틀고딕2;"></div>
	<div><input type="button" onclick="back()" value="로그아웃" style="font-family: a타이틀고딕2;"></div>
</div>
</body>
</html>
<script>
	function back(){		
		location.href = "home_main.jsp";		
	}
	function isback(){		
		location.href = "home_main_login.jsp";		
	}
</script>
