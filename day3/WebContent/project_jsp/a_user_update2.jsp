<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		font-family: a타이틀고딕2;
	}
</style>
</head>
<body>
	<%@ include file="jdbc_set.jsp"%>
	<%
		request.setCharacterEncoding("UTF-8");
	
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd");
		String uname = request.getParameter("uname");
		String phone = request.getParameter("phone");
		String age = request.getParameter("age");
		String addr = request.getParameter("addr");
		
		ResultSet rs = null; 
		Statement stmt = null; 
		try{			
			String update = "";
			if(pwd.equals("") || pwd == null){
				 update = "UPDATE YNY_TB_USER SET  U_NAME = '" + uname + "', PHONE = '" + phone + "', AGE = '" + age + "'" + ", ADDR = '" + addr + "' WHERE U_ID = '"+ uId +"'";				 
			}else{
				 update = "UPDATE YNY_TB_USER SET  PWD = '" + pwd + "', U_NAME = '" + uname + "', PHONE = '" + phone + "', AGE = '" + age + "'" + ", ADDR = '" + addr + "' WHERE U_ID = '"+ uId +"'";
			}
				stmt = conn.createStatement();
				stmt.executeUpdate(update);
			
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	%>
</body>
</html>
<script>
	alert("수정 완료");
	
	back();

	function back() {
		window.opener.getReturn();
		window.close(); 
	}
</script>