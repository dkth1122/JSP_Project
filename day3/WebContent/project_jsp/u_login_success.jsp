<%@page import="java.io.ObjectInputFilter.Status"%>
<%@page import="java.security.interfaces.RSAKey"%>
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
    	width: 100px;
    	font-size:32px;
    	display: block;
		position: absolute;
		top : 35%;
        left: 35%;
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
</head>
<body>
<%@ include file="jdbc_set.jsp" %>

<div id="container">
<%

	request.setCharacterEncoding("UTF-8");

	String uId = (String)session.getAttribute("uId");
	String uname = (String)session.getAttribute("uname");
	
	session.setAttribute("uId", uId);
	session.setAttribute("uname", uname);
	
%>

        <div id="container">
            <div class="c_1">
                    <img src ="img/pngwing.com (1).png">
                    <a><%=uname%> 로그인 성공★</a>
            </div>
            <img id="gam" onclick="isback()" src = "img/image-removebg-preview.png">
            	<fieldset>
                        <div class="f-1">▲ 홈페이지로 </div>
                    </fieldset>
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