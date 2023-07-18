<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 탈퇴 처리</title>
</head>
<body>
    <%@ include file="jdbc_set.jsp" %>
    <%
        request.setCharacterEncoding("UTF-8");

        String uId = (String) session.getAttribute("uId");

        try {
            // 회원 탈퇴 요청 처리 (BANYN 컬럼을 'S'로 업데이트)
            PreparedStatement pstmt = conn.prepareStatement("UPDATE YNY_TB_USER SET BANYN = 'S' WHERE U_ID = ?");
            pstmt.setString(1, uId);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();

            // 회원 탈퇴 요청 성공 시 메인 페이지로 이동
  %> 
  			
  			<div>회원 탈퇴가 완료되었습니다</div>
			<div><input type="button" onclick="isback()" value="돌아가기" ></div>	        
   <%         
        } catch (SQLException e) {
            out.println("SQLException: " + e.getMessage());
        }
    %>
</body>
</html>
<script>
	function isback() {
		location.href = "home_main.jsp";
	}
</script>
