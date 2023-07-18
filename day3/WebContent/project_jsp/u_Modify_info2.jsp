<%@page import="java.security.interfaces.RSAKey"%>
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
	
		String uId = request.getParameter("user");
		String pwd = request.getParameter("pwd");
		String uname = request.getParameter("uname");
		String phone = request.getParameter("phone");
		String age = request.getParameter("birth");
		String addr = request.getParameter("addr");
		String birth = request.getParameter("birth");
		String email = request.getParameter("email");
		
 		ResultSet rs = null; 
		Statement stmt = null; 
		
		try{			
			String update = "";
			if(pwd == null || pwd.equals("")){
				 update = "UPDATE YNY_TB_USER SET  U_NAME = '" + uname + "', PHONE = '" + phone + "', BIRTH = '" + birth + "' , EMAIL ='" + email + "' , ADDR = '" + addr + "' , UP_D = NOW()  WHERE U_ID = '"+ uId +"'";				 
		%>
			<div>변경 완료</div>
			<div><input type="button" onclick="back()" value="닫기"></div>
		<%
			}else{
				 update = "UPDATE YNY_TB_USER SET  PWD = '" + pwd + "',  U_NAME = '" + uname + "', PHONE = '" + phone + "', BIRTH = '" + birth + "' , EMAIL ='" + email + "' , ADDR = '" + addr + "' , UP_D = NOW()  WHERE U_ID = '"+ uId +"'";				 
	%>
		<div>변경 완료</div>
		<div><input type="button" onclick="back()" value="닫기"></div>
	<%		
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
	function back() {
        window.close();
        window.opener.getReturn();
    }
</script>