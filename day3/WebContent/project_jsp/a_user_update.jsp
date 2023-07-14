<%@page import="oracle.net.aso.r"%>
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
	<form action="a_user_update2.jsp">
	<%
		request.setCharacterEncoding("UTF-8");

		String uId = request.getParameter("uId");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM YNY_TB_USER WHERE U_ID= '" + uId + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){

		String phone = rs.getString("PHONE") != null ?  rs.getString("PHONE") : "";
		String age = rs.getString("AGE") != null ?  rs.getString("AGE") : "";
		String addr = rs.getString("ADDR") != null ?  rs.getString("ADDR") : "";
		
	%>
		<input name="uId" value="<%=uId%>" hidden>
		<div><label> 비밀번호 : <input name="pwd" type="password"></label></div>
		<div><label> 이름 : <input name="uname" value="<%= rs.getString("U_NAME") %>"></label></div>
		<div><label> 전화번호 : <input name="phone" value="<%= phone %>"></label></div>
		<div><label> 나이: <input name="age" value="<%= age %>"></label></div>
		<div><label> 주소: <input name="addr" value="<%= addr %>"></label></div>
	<%
			} else {
				out.println("없는 사용자");
			}
		}catch(SQLException e){
			out.println(e.getMessage());
		}

	%>
	<div><input type="submit" value="변경" ></div>	
	</form>
</body>
</html>
