<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의게시판</title>
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
		color:rgb(255, 99, 146);
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
    
	fieldset {
        width: 500px;
        height: 300px;
        margin: 0px auto;
        margin-top: 320px;
        margin-bottom: 32px;
		background-color: white;
        border: 3px dashed pink;
        border-radius: 50px;
        text-align: center;
	}
	
	#f-d
	{
		font-family: "삼립호빵";
		color:rgb(255, 99, 146);
		font-size: 32px;
	}
	
	.btn_input {
		width: 100px;
	  	height: 24px;
		font-size: 15px;
		font-family: a타이틀고딕2;
		color:rgb(255, 99, 146);
		border-radius: 30px;
		border:1px solid pink;
		background-color: #fdfdd3;
		cursor: pointer;
		margin: 10px 1px;
	}
	
	.a{
		border:1px solid pink;
		margin: 12px auto;
	}
	
	input:focus { 
		outline: none !important; border-bottom-color: pink; box-shadow: 0 0 10px #d6a8e9; 
	}
	
	#gam:hover {
	cursor: pointer;
	}
	
	#gam{
			position: absolute;
	        top : 0%;
	        left: 38%;
		}
	
	.q-1{
		margin: 24px;
	}
	
	.in1{
		width : 300px;
		height: 100px;
		border-color: pink;
	}
	
		.in2{
		border-color: pink;
	}
		
    </style>
</head>
<body>
   
<% String uId = (String)session.getAttribute("uId");
   session.setAttribute("uId", uId);
   %>
	<img id="gam" src ="img/kp-removebg-preview.png">
   <fieldset>
   <form action="u_QnA_Upload.jsp" name="check">
      <div class="q-1">제목 : <input class="in2" type="text" name="tit"></div>
      <div class="q-1">내용 : <input class="in1" type="text" name="cont" ></div>
      <div><input class="btn_input" onclick="btn()" type="button" value="제출하기"></div>
      <div><input class="btn_input" onclick="isback()" type="button" value="돌아가기"></div>
   </form>
</fieldset>
</body>
</html>
<script>
   var form = document.check;
   
   function btn() {
   if(form.tit.value == "" || form.tit.value == undefined){
      alert("제목을 입력해주세요");
      form.tit.focus();
      return;
   }
   if(form.cont.value == "" || form.cont.value == undefined){
      alert("내용을 입력해주세요");
      form.cont.focus();
      return;
   }
      form.submit();
   }

   function isback() {
      location.href="u_mypage.jsp"; 
   } 
   
</script>