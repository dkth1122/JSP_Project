<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
			String uid = request.getParameter("uid");
			String pwd1 = request.getParameter("pwd1");
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
			 
			String birth = "";
					if(ageM.length() < 2 && ageD.length() < 2  ){
						 birth = ageY+"0"+ageM+"0"+ageD;
					}else if (ageM.length() < 2 ){
						 birth = ageY+"0"+ageM+ageD;
					}else if(ageD.length() < 2){
						 birth = ageY+ageM+"0"+ageD;
					};
					
			String email = ""; 
					if(email2 == null || email2.equals("")){
					email = emailID + "@" + emailDM;
					}else{
						email = emailID + "@" + email2;
					}
					
			String phone = phone1 + phone2 + phone3;		
			
			session.setAttribute("uname", uname);	
			
			
			Statement stmt = null;
			ResultSet rs = null;
			
			
			try{
			stmt = conn.createStatement(); 
			rs = stmt.executeQuery("select * from YNY_TB_USER");
			
				while(rs.next()){
					String a = rs.getString("U_ID");
					if(uid.equals(a)){			
							out.println("이미 있는 아이디 입니다.");
						}else{
							String sql = "INSERT INTO YNY_TB_USER(U_ID, PWD, U_NAME, BIRTH, EMAIL, PHONE, ADDR, SIGNUP_D) VALUES('"+uid+"','"+pwd1+ "', '"+uname+"', '" + birth + "','"+  email   +"' , '"+phone+"', '"+addr+"', NOW())";
							stmt = conn.createStatement();
							stmt.executeUpdate(sql);
							out.println("YNY_TB_USER 테이블 삽입이 성공했습니다.");
						}//else
				}
					rs.close();

			} catch (SQLException ex) {
				out.println("YNY_TB_USER 테이블 삽입이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 		
			
	%>
</body>
</html>
<script>
	location.href ="signup_cng.jsp"
</script>