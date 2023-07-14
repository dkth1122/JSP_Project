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
	<%@ include file="../jsp_day3/jdbc_set.jsp"%>
	<% request.setCharacterEncoding("UTF-8"); %>

	<% 
			String uid = request.getParameter("uid");
			String pwd1 = request.getParameter("pwd1");
			String uname = request.getParameter("uname");
			String phone = request.getParameter("phone");
			String age = request.getParameter("age");
			String addr = request.getParameter("addr");
			
			Statement stmt = null;
			ResultSet rs = null;
			
			
			try{
			stmt = conn.createStatement(); 
			rs = stmt.executeQuery("select * from TBL_USER");
			
				while(rs.next()){
					String a = rs.getString("U_ID");
					if(uid.equals(a)){			
							out.println("이미 있는 아이디 입니다.");
						}else{
							String sql = "INSERT INTO TBL_USER(U_ID, PWD, U_NAME, PHONE, AGE, ADDR) VALUES('"+uid+"','"+pwd1+ "', '"+uname+"', '"+phone+"', '"+age+"', '"+addr+"')";
							stmt = conn.createStatement();
							stmt.executeUpdate(sql);
							out.println("TBL_USER 테이블 삽입이 성공했습니다.");
						}//else
				}
					rs.close();

			} catch (SQLException ex) {
				out.println("TBL_USER 테이블 삽입이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 		
			
	%>
</body>
</html>