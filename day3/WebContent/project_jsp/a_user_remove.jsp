<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Remove</title>
</head>
<body>
	<%@ include file="jdbc_set.jsp" %>
<%
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uId");
		Statement stmt = null;

		try {
			stmt = conn.createStatement();
			String select = "SELECT * FROM YNY_TB_USER WHERE U_ID = '" + uId + "'";
			ResultSet rs = stmt.executeQuery(select);
			if(rs.next()){
				if("Y".equals(rs.getString("BANYN"))){
					String delete = "DELETE FROM YNY_TB_USER WHERE U_ID = '" + uId + "'";
					stmt.executeUpdate(delete);
					out.println("삭제 했습니다.");
				} else {
					out.println("정지된 회원만 삭제할 수 있습니다.");
				} 
			} else {
				out.println("해당 회원이 존재하지 않습니다.");
			}
		} catch (SQLException ex) {
			out.println("SQLException: " + ex.getMessage());
		} 
	%>
	<input type="button" onclick="back()" value="되돌아가기">
</body>
</html>
<script>
	alert("삭제 완료");
	
	back();
	
	function back() {
	    window.opener.getReturn();
	    window.close();
	}
</script>