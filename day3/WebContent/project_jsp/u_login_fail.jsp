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
        color: rgb(255, 99, 146);
    }
	
	fieldset {
        width: 500px;
        height: 40px;
		margin-bottom: 20px;
		background-color: white;
        border: 3px dashed pink;
        border-radius: 50px;
	}
	.f-1{
		 text-align: center;
		 font-size: 32px;
		 color: rgb(255, 99, 146);
	}
	
	
	#gam:hover {
	cursor: pointer;
	}
</style>
<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
</head>
<body>
<%@ include file="jdbc_set.jsp" %>

        <div id="container">
            <div class="c_1">
                    <img src ="img/pngwing.com (1).png">
                    <a>틀렷어.</a>
            </div>
            <img id="gam" onclick="isback()" src = "img/image-removebg-preview.png">
            	<fieldset>
                        <div class="f-1">▲ 돌아가고 싶으면 누르시오.</div>
                    </fieldset>
        </div>
        
</body>
</html>
<script>

function isback() {
	location.href = "u_login.jsp";
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