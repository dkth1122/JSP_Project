<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="jdbc_set.jsp"%>
	<% request.setCharacterEncoding("UTF-8"); %>

	<% 
		String uId = request.getParameter("uId");
		String pwd = request.getParameter("pwd");
		String uname = request.getParameter("uname");
		String phone1 = request.getParameter("phone1");
		String phone2 = request.getParameter("phone2");
		String phone3 = request.getParameter("phone3");
		String ageY = request.getParameter("age-year");
		String ageM = request.getParameter("age-month");
		String ageD = request.getParameter("age-day");
		String addr = request.getParameter("addr");
		String emailID = request.getParameter("email");
		String emailDM = request.getParameter("e-domain");
		String email2 = request.getParameter("e-domain2");
		
		session.setAttribute("uId", uId);
		
		String birth = "";
		if (ageY == null || ageM == null || ageD == null) {
			birth = "";
		} else if (ageM.length() < 2 && ageD.length() < 2) {
			birth = ageY + "0" + ageM + "0" + ageD;
		} else if (ageM.length() < 2) {
			birth = ageY + "0" + ageM + ageD;
		} else if (ageD.length() < 2) {
			birth = ageY + ageM + "0" + ageD;
		}
					
		String email = ""; 
		
		
		if(emailID  == null || emailID.equals("")){
			email = "" ;
		}
		else if (email2 == null || email2.equals("") && emailDM == null || emailDM.equals("")) {
				email = "" ;
		}else if(email2 == null || email2.equals("")){
			email = emailID + "@" + emailDM ;
		}
		else{
			email = emailID + "@" + email2;
		}
						
		String phone = phone1 + phone2 + phone3;		
			
		session.setAttribute("uname", uname);	
		
		Statement stmt = null;
		ResultSet rs = null;
			
		try {
			stmt = conn.createStatement(); 
			rs = stmt.executeQuery("SELECT U_ID FROM YNY_TB_USER WHERE U_ID='" + uId + "'");

				String sql = "INSERT INTO YNY_TB_USER(U_ID, PWD, U_NAME, BIRTH, EMAIL, PHONE, ADDR, SIGNUP_D) VALUES('" + uId + "','" + pwd + "', '" + uname + "', '" + birth + "','" +  email + "' , '" + phone + "', '" + addr + "', NOW())";
				stmt.executeUpdate(sql);
		
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 		
			
	%>
</body>
</html>
<script>
location.href ="signup_cng.jsp";
</script>
