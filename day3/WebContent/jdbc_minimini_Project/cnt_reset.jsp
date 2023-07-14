<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>팝업창</title>
<style>
	*{
		font-family: a타이틀고딕2;
		font-size: 24px;
	}
	body{
		width: 100px
		margin: 10px auto;
	}
</style>
</head>
<body>
<%@ include file="../jsp_day3/jdbc_set.jsp" %>
<%
	String uId = request.getParameter("uId");

	ResultSet rs = null; 
	Statement stmt = null; 
	
	try{
		stmt = conn.createStatement();
		String update = "UPDATE TBL_USER SET CNT = 0 WHERE U_ID = '"+ uId+"'";
		stmt.executeUpdate(update);
		out.println("해지 완료");
	
	}catch(SQLException e){
		out.println(e.getMessage());
	}
	%>

<div><button onclick="back()">되돌아가기</button></div>

</body>
</html>
<script>
	function back(){
		window.opener.getReturn();
		window.close(); 
	}
</script>