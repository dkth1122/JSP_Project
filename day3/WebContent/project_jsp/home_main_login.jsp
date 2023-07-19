<%@page import="javax.tools.DocumentationTool.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    
     /* header(메뉴바) 스타일 */
    .header{
	  width: 100%;
	  height: auto;
	  background-color: rgba(255, 255, 255, 0.8);
      overflow:hidden;
      transition: all 0.6s;
    }
    
    .top{
        top:15%;
        left: 85%;
        background-color: rgba(255, 255, 255, 0.8);
        height: 37px;
    }

    .t-in{
        float: right;
    }
    
    .t-in > a{
        display: block;
        margin: 10px 10px;
        height: 20px;
        float: left;
    }

    .t-img{
	  width: 20px;
	  height: 20px;
      margin-top: 9px;
      margin-right: 10px;
    }

    .h-h{
        clear: both;
        display: block;
        width: 260px;
        height: 90px;
        float: left;
        font-size: 50px;
        padding-left: 20px;
        padding-top: 24px;
    }

    .h-in{
        float: left;
        height: 114px;
        transition: all 0.6s;
    }

    .h-c{
      	width:195px;
        display: inline-block;
        font-size: 16px; 
        margin: 30px 20px;
        text-align: center;
    }  


    a{
    	text-decoration:none;
    	color:black;
    }
    
    .category{
    	list-style: none;
    }
    
     .category>li {
        position: relative;
        
    }
    
    .category>li ul {
        width: 195px;
    	padding:0px;
        padding-top: 30px;
        display: inline-block;
        position: absolute; 
        top: 100%; 
        left: 0; 
    	list-style: none;
        opacity: 0;
        transition: all 0.6s;
    }
    
    .h-in:hover{
    	height: 168px;
	}

    .category:hover ul {
        opacity: 1;
	}


    /*body 비디오 박스 스타일*/
    video{
        width: 100%; 
    }

    .video-box{
        height: 800px; 
        overflow: hidden;
        margin: 0px auto; 
        clear: both;
        transition: all 0.6s;
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


    /*video 밑 div박스 스타일 */
    #wrapper{
      width:100%;
    }

    .a-content {
        width: 50%;
        height: 600px;
        margin: 0;
        padding: 0;
        float: left;
        }

    .a-content>img{
        width: 80%;
        height: 90%;
    }

    .b-content {
        width: 50%;
        height: 600px;
        margin: 0;
        padding: 0;
        background-color: #e6da40;
        float: left;
        }
    
    .c-content {
        clear: both;
        width: 100%;
        height: 400px;
        background-color: #ff6d6d;
    }

    .d-content {
        width: 100%;
        height: 400px;
        background-color: #92e9ff;
    }


    /* footer 스타일 */
    @font-face {
        font-family: "a타이틀고딕2";
        src: url("A타이틀고딕2.TTF") format("truetype");
    }

    #container_f {
        width: 100%;
        height: 200px;
        font-family: a타이틀고딕2;
        background-color: rgb(245, 233, 224);
        margin: 0px auto;
    }
    
    .part_box {
        width: 1080px;
        height: 200px;
        margin: auto;
    }
    
    .part_logo,
    #part1,
    #part2,
    #part3 {
        width: 250px;
        float: left;
        margin: 50px auto;
    }

    .part_logo{
        height: 76px;
        background-color: #000000;
        margin-right: 30px;
    }
    .logo_guide{
        color: #ffffff;
        font-size: 30px;
        line-height: 14px;
        text-align: center;
    }

    #f_img {
        position: absolute;
        left: 7%;
        top: 30%;
        width: 100px;
    }
    .제목{
        font-weight: bold;
    }
    .내용{
        font-size: 10px;
    }
    .rborder{
        border-right: 1px solid #000000;
    }
    a{
        text-decoration: none;
        color: yellowgreen;
    }       
  </style>
</head>
<body>
<%
	String uname = (String)session.getAttribute("uname");
	session.setAttribute("uname", uname);
	
	String uId = (String)session.getAttribute("uId");
	session.setAttribute("uId", uId);
	
	if (uname == null || uname.equals("")) {
	    response.sendRedirect("home_main.jsp");
	}

%>

<div class="header">
    <div class="top">
    <div class="t-in">
        <a><%= uname %>님 환영합니다~❤</a>     
        <a href="u_mypage.jsp">마이페이지</a>
        <a href="home_main.jsp">로그아웃</a>
        <img class="t-img" src="./img/free-icon-logout-3580154.png">
    	</div>
    </div>
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
<video src="./img/AdobeStock_359391411.mov" autoplay muted loop>
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
  <div id="container_f">
    <div class="part_box">
        <div class="part_logo"><p class="logo_guide">로고 집어넣는 곳</p></div>
        <div id="part1">
            <div class="제목"> 네이버㈜</div>
            <div class="내용">
                <div>사업자등록번호 220-81-62517</div>
                <div>통신판매업신고번호 2006-인천-0692호</div>
                <div>대표이사 최인경</div>
                <span class="rborder">전화 1533-XXXX</span>
                <span>이메일 XXX@naver.com</span>
            </div>
        </div>

        <div id="part2">
            <div class="제목">고객센터</div>
            <div class="내용">
                <div>강원도 춘천시 퇴계로 89 강원전문건설회관</div>
                <div>wjsghk 1588-XXXX</div>
                <div>결제도용신고 1588-XXXX</div>
                <div><a href="javascript:;">1:1문의 바로가기</a></div>
            </div>
        </div>

        <div id="part3">
            <div class="제목">전자금융거래 분쟁처리</div>
            <div class="내용">
                <div>전화 1588-XXXX</div>
                <div><a href="javascript:;">1:1 문의 바로가기</a></div>
            </div>
        </div>
    </div>
</div>
</html>

