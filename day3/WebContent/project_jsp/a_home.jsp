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
		background-color:#e8ffef;
	}
	
    img{
        width: 400px;
    }

	.c_1{
		position: absolute;
        top : 3%;
        left: 50%;
	}
	
	fieldset {
        width: 500px;
        height: 400px;
        margin: 0px auto;
        margin-top: 360px;
        margin-bottom: 32px;
		background-color: white;
        border: 3px dashed pink;
        border-radius: 50px;
	}
	
	#f-d{
		font-family: "삼립호빵";
		color:rgb(255, 99, 146);
		font-size: 32px;
		text-align: center;
		margin: 24px;
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
		margin: 40px auto;
		cursor: pointer;
		display: block;
	}

	
	input:focus { 
		outline: none !important; border-bottom-color: pink; box-shadow: 0 0 10px #d6a8e9; 
		}
</style>
</head>
<body>
<div class="c_1">
	<img id="gam" src="./img/kp4.jpg">
</div>
<fieldset>
<div id="f-d">관리자 홈페이지</div>
	<button class="btn_input" onclick="go()">고객 관리</button>
	<button class="btn_input"  onclick="qna()">문의 확인</button>
	<button class="btn_input"  onclick="mem()">멤버쉽 관리</button>
	<button class="btn_input"  onclick="isback()">로그아웃</button>
</fieldset>
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