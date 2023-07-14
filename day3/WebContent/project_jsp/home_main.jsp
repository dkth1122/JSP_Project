<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Main page</title>
  <style>
    *{
        font-family: a타이틀고딕2;
    }
    body { 
        padding: 0px; 
        margin: 0px; 
    }

    #wrapper{
      width:100%;   
      display:grid;
      margin: 100px auto;
      grid-template-areas:
		"   a    b   b   "
		"   c    d    d   ";
    }

    .a-content {
         grid-area: a; 
         height: 600px;
         background-color: #ffffff;
         margin: 10px 10px;
        }

    .a-content>img{
        width: 80%;
        height: 90%;
    }

    .b-content {
         grid-area: b; 
         height: 400px;
         background-color: #e6da40;
         margin: 10px 10px;
        }
    
        .c-content {
         grid-area: c; 
         height: 400px;
         background-color: #ff6d6d;
         margin: 10px 10px;
        }

        .d-content {
         grid-area: d; 
         height: 400px;
         background-color: #92e9ff;
         margin: 10px 10px;
        }

    .footer {
         width: 100%;
         height: 150px;
         background-color: #f0ed3c;
         margin: 10px 10px;
        }

    video{
        width: 100%; 
    }

    .video-box{
        height: 800px; 
        overflow: hidden;
        margin: 0px auto; 
        position: relative;
	    top:200px;
        clear: both;
    }

    .v-text{
        position: absolute; 
        top: 50%; 
        width: 100%;
    }

    .v-text p { 
        margin-top: -24px; 
        text-align: center; 
        font-size: 48px; 
        color: #ffffff; 
    }

    .header{
	  width: 100%;
	  height: 200px;
	  background-color: rgba(255, 255, 255, 0.8);
	  position: fixed;
	  top: 0;
	  left: 0;
	  z-index: 9999; /* 헤더의 쌓임 순서를 설정 */
    }

     .h-h{
        float:left;
        font-size: 50px; 
        margin: 20px; 
        margin-top: 40px; 
        color: white;
    } 

      .h-c{
      	width:200px;
        display: inline-block;
        font-size: 16px; 
        margin: 30px 20px;
        text-align: center;
    }  

    .t-img{
	  width: 20px;
	  height: 20px;
    }

    .top{
        position: relative;
        top:15%;
        left: 85%;
    }

    .t-in{
    	width:400px;
        display: inline;
        padding: 10px 10px;
    }
    
    a{
    	text-decoration:none;
    	color:black;
    }
    
    .category{
    	list-style: none;
    	position: absolute;
    	top:15%;
    	left: 15%;
    }
    
     .category>li {
        position: relative;
    }
    
    .category>li ul {
    	padding:30px;
    	background-color: rgba(255, 255, 255, 0.8);
        display: none;
        position: absolute; 
        top: 100%; 
        left: 0; 
    	list-style: none;
    }
    
    .category>li:hover > ul {
    	display: inline-block;
	}
    
  </style>
</head>
<body>
<%
	if(request.isRequestedSessionIdValid()){
		session.invalidate();
	}
%>
<div class="header">
    <div class="top">
        <div class="t-in"><a href="u_login.jsp">로그인</a></div>
        <div class="t-in"><a href="signup.jsp">회원가입</a></div>     
        <div class="t-in"><a href="u_login.jsp"> 마이페이지</a> <img class="t-img" src="./img/dog-pawprint-on-a-heart.png"></div>
    </div>
    
 <div class="h-h"><a href="home_main.jsp">감자의 집</a></div> 
 <div class="h-in">
	 <ul class="category">
	 	<li class="h-c">올해의 강아지
	 		<ul>
				<li>하위 카테고리1</li>
				<li>하위 카테고리2</li>
	   		 </ul>   
	   </li>
	   
	   <li class="h-c">선물을 보내요
	     	<ul>
				<li>하위 카테고리3</li>
				<li>하위 카테고리4</li>
	    	</ul>   	
	    </li>
	    
	    <li class="h-c">안녕 친구들
	      		<ul>
					<li>하위 카테고리5</li>
					<li>하위 카테고리6</li>
	    		</ul>   
	    </li>
	  
	    <li class="h-c">즐거운 쇼핑
	 		<ul>
				<li>하위 카테고리7</li>
				<li>하위 카테고리8</li>
	    	</ul>   
	    </li>
	    
	    <li class="h-c">고객센터
	     		<ul>
				<li>하위 카테고리9</li>
				<li>하위 카테고리10</li>
	    </ul>   
	    </li>
	</ul>     
</div>
</div>
<div class="video-box">
<video src="./img/AdobeStock_359391411.mov" loop autoplay>
    <strong>안녕! 감자의 집에 온 걸 환영해요 .</strong>
</video>
<div class="v-text">
    <p>안녕! 감자의 집에 온 걸 환영해요</p>
  </div>
  <p>로그인 </p>
</div>

  <div id="wrapper">
    <div class="a-content"><img src="./img/kp3.jpg"></div>
    <div class="b-content"></div>
    <div class="c-content">box3</div>
    <div class="d-content">box3</div>
  </div>
  <div class="footer">box4</div>
</body>
</html>