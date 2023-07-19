<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	* {
		font-family: a타이틀고딕2;
	}
</style>
</head>
<body>
	<%@ include file="jdbc_set.jsp"%>
	<form name="list">
		<%
			request.setCharacterEncoding("UTF-8");

			String memNum = request.getParameter("memNum");
			String rd = request.getParameter("rd");
			String ed = request.getParameter("ed");
			String st = request.getParameter("st");

			ResultSet rs = null;
			Statement stmt = null;

			try {
				String update = "";
				
					update = "UPDATE YNY_TB_MEMBERSHIP SET REG_DATE = '"
							+ rd + "' , EXP_DATE ='" + ed + "' , STATUS = '" + st + "' , UP_D = NOW() WHERE MEM_NUM = '"
							+ memNum + "'";

				stmt = conn.createStatement();
				stmt.executeUpdate(update); 

				// 수정 완료를 알리는 메시지를 출력
				out.println("<script>alert('수정 완료'); window.opener.getReturn(); window.close();</script>");
			} catch (SQLException e) {
				out.println(e.getMessage());
			}
		%>
	</form>
</body>
</html>
