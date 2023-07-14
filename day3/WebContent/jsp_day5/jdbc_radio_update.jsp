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
	<%
		request.setCharacterEncoding("UTF-8");
		String stuNo = request.getParameter("stuNo");
		String stuName = request.getParameter("stuName");
		String stuDept = request.getParameter("stuDept");
		String stuGrade = request.getParameter("stuGrade");
		String stuHeight = request.getParameter("stuHeight");
		ResultSet rs = null; 
		Statement stmt = null; 
		try{
			stmt = conn.createStatement();
			String update = "UPDATE STUDENT SET STU_DEPT = '" + stuDept + "', STU_GRADE = '" + stuGrade + "', STU_NAME = '" + stuName + "', STU_HEIGHT = '" + stuHeight + "' WHERE STU_NO = " + stuNo;
			stmt.executeUpdate(update);
			
			String select = "SELECT * FROM STUDENT WHERE STU_NO = " + stuNo;
			rs = stmt.executeQuery(select);
			if(rs.next()){
	%>
		<div>학번 : <%= rs.getString("STU_NO")%></div>
		<div>이름 : <%= rs.getString("STU_NAME")%></div>
		<div>학년 : <%= rs.getString("STU_GRADE")%></div>
		<div>학과 : <%= rs.getString("STU_DEPT")%></div>	
	<%
		}
	}catch(SQLException e){
		out.println(e.getMessage());
	}
	%>
</body>
</html>