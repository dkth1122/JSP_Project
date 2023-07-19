<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
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
			background-color: #fdfdd3;
		}

		fieldset {
		    width: 300px;
	        height: 300px;
			background-color: white;
	        border: 3px dashed pink;
	        border-radius: 50px;
	        text-align: center;
		}
		
		#f-d{
			font-family: "삼립호빵";
			color:rgb(255, 99, 146);
			font-size: 32px;
			margin: 10px auto;
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
		}
		.li_label {
			font-weight: bold;
			color: rgb(255, 99, 146);
		}
		
		input{
			margin: 5px;
			border: 1px solid pink;
		}
		
		input:focus { 
			outline: none !important; border-bottom-color: pink; box-shadow: 0 0 10px #d6a8e9; 
		}
	</style>
</head>
<body>
	<%@ include file="jdbc_set.jsp"%>
	<form action="a_user_update2.jsp">
	<%
		request.setCharacterEncoding("UTF-8");

		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		String uId = request.getParameter("uId");
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM YNY_TB_USER WHERE U_ID= '" + uId + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
		
		String phone = rs.getString("PHONE") != null ?  rs.getString("PHONE") : "";
		String addr = rs.getString("ADDR") != null ?  rs.getString("ADDR") : "";
		String birth = rs.getString("BIRTH")  != null ? rs.getString("BIRTH") : "-";
		String email = rs.getString("EMAIL")  != null ? rs.getString("EMAIL") : "-";
		
	%>
		<fieldset>
			<div id="f-d">회원 정보 수정</div>
			<div class="a">
				<input name="uId" value="<%=uId%>" hidden>
				<div><label class="li_label"> 비밀번호 : <input name="pwd" type="password"></label></div>
				<div><label class="li_label"> 이름 : <input name="uname" value="<%= rs.getString("U_NAME") %>"></label></div>
				<div><label class="li_label"> 전화번호 : <input name="phone" value="<%= phone %>"></label></div>
				<div><label class="li_label"> 생년월일: <input name="birth" value="<%= birth %>"></label></div>
				<div><label class="li_label"> 이메일: <input name="email" value="<%= email %>"></label></div>
				<div><label class="li_label"> 주소: <input name="addr" value="<%= addr %>"></label></div>
				</div>
	<%
			} else {
				out.println("없는 사용자");
			}
		}catch(SQLException e){
			out.println(e.getMessage());
		}

	%>
	<input class="btn_input" type="submit" value="변경" >
	</fieldset>
</form>
</body>
</html>
