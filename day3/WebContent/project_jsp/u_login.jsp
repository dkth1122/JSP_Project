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
		background-color: #fdfdd3;
	}
	
	#container {
		width: 600px;
		margin: 10px auto;
	}
	

    img{
        width: 400px;
        margin-top: 30px;
    }

	.c_1{
		position: absolute;
        top : 0%;
        left: 50%;
	}
    
    .c_1:first-child > img{
        width: 250px;
    }
    
    .c_1:first-child > a{
   		font-family: "삼립호빵";
    	width: 120px;
    	font-size:32px;
    	display: block;
		position: absolute;
		top : 48%;
        left: 30%;
        text-decoration: none;
        color: pink;
    }
	
	fieldset {
        width: 500px;
        height: 280px;
		margin-bottom: 20px;
		background-color: white;
        border: 3px dashed pink;
        border-radius: 50px;
	}
	.f-1{
		 text-align: center;
	}
	
	#f-d
	{
		font-family: "삼립호빵";
		color:pink;
		font-size: 32px;
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
		font-weight: bold;
		color: pink;
		float: left;
	}
	
	.txt_input {
		width: 300px;
		height: 30px;
		font-family: a타이틀고딕2;
		
	}
	
	.btn_input {
		width: 150px;
	  	height: 36px;
		font-size: 15px;
		font-family: a타이틀고딕2;
		color:pink;
		border-radius: 30px;
		border:1px solid pink;
		background-color: #fdfdd3;
		margin: 10px 200px;
	}

	input[required] {
        border: none;
		border:1px solid pink;
	}
	
	input:focus { 
		outline: none !important; border-bottom-color: pink; box-shadow: 0 0 10px #d6a8e9; 
		}
	
	li label {
		font-style: italic;
		color: rgb(79, 62, 173);
	}
	
	.li_radio{
		color: #9ADFB0;
	}
	
	input:checked+label {
		font-weight: bold;
	}
	
	#b_check{
		margin-left:10px;
		font-family: a타이틀고딕2;
	}
	
	#gam:hover {
	cursor: pointer;
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
            <div class="c_1">
                    <img src ="img/pngwing.com (1).png">
                    <a href="signup.jsp">회원가입</a>
            </div>
            <img id="gam" onclick="isback()" src = "img/image-removebg-preview.png">
				<fieldset>
                    <ul>
                        <div class="f-1">
                            <li><div id="f-d">SIGN IN</div></li>
                                <label class="li_radio"><input type="radio" value="U" name="stat" checked>일반회원</label>
                                <label class="li_radio"><input type="radio" value="A" name="stat">관리자</label>
                            </div>
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
					<button class="btn_input" id="left_btn" type="submit">로그인
                    </fieldset>
              </div>
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