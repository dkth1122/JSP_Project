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

		String stu[] = request.getParameterValues("stu");
		
		ResultSet rs = null; 
		Statement stmt = null; 
		
		try{
			stmt = conn.createStatement();
			
			for(int i=0; i < stu.length; i++){
				String sql = "DELETE FROM STUDENT WHERE STU_NO = '" + stu[i] + "'";
				rs = stmt.executeQuery(sql);
			};
			
			out.println("삭제 되었습니다.");
	
			}catch(SQLException e){
				out.println(e.getMessage());
			}
		
	%>
	<button onclick="back()">뒤로가기</button>
</body>
</html>
<script>
	function back() {
		location.href = "jdbc_checkbox2.jsp"
	}
</script>