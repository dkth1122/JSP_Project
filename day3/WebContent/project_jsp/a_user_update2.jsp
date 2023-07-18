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

			String uId = request.getParameter("uId");
			String pwd = request.getParameter("pwd");
			String uname = request.getParameter("uname");
			String phone = request.getParameter("phone");
			String addr = request.getParameter("addr");
			String birth = request.getParameter("birth");
			String email = request.getParameter("email");

			ResultSet rs = null;
			Statement stmt = null;

			try {
				String update = "";
				if (pwd == null || pwd.equals("")) {
					update = "UPDATE YNY_TB_USER SET  U_NAME = '" + uname + "', PHONE = '" + phone + "', BIRTH = '"
							+ birth + "' , EMAIL ='" + email + "' , ADDR = '" + addr + "' , UP_D = NOW()  WHERE U_ID = '"
							+ uId + "'";
				} else {
					update = "UPDATE YNY_TB_USER SET  PWD = '" + pwd + "',  U_NAME = '" + uname + "', PHONE = '" + phone
							+ "', BIRTH = '" + birth + "' , EMAIL ='" + email + "' , ADDR = '" + addr
							+ "' , UPDATE = NOW()  WHERE U_ID = '" + uId + "'";
				}
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
