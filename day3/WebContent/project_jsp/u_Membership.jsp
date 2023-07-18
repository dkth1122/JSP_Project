<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>멤버십</title>
</head>
<body>
    <%@ include file="jdbc_set.jsp" %>
    <h1>멤버십 정보</h1>
    <%
        request.setCharacterEncoding("UTF-8");

        String uId = (String) session.getAttribute("uId");

        try {
            // 멤버십 정보 조회
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM YNY_TB_MEMBERSHIP WHERE U_ID = ?");
            pstmt.setString(1, uId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
            	String num = rs.getString("MEM_NUM");
                String regDate = rs.getString("REG_DATE");
                String expDate = rs.getString("EXP_DATE");
                String status = rs.getString("STATUS");

                // 멤버십 정보 표시
    %>
                <h2>회원님의 멤버십 정보</h2>
                <p>회원번호: <%= num %></p>
                <p>등록일: <%= regDate %></p>
                <p>만료일: <%= expDate %></p>
                <p>상태: <%= status %></p>
    <%
            } else {
                // 멤버십 정보가 없는 경우
    %>
                <h2>멤버십 정보 없음</h2>
                <p>멤버십을 구독 또는 연장해주세요.</p>
    <%
            }

            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            out.println("SQLException: " + e.getMessage());
        }
    %>

    <h1>멤버십 추가</h1>
    <form action="u_Membership_A_Process.jsp" method="post">
        구독 개월 수: <input type="number" name="subscriptionMonths" required><br>
        <input type="submit" value="멤버십 추가">
    </form>

    <h1>멤버십 취소</h1>
    <form action="u_Membership_C_Process.jsp" method="post">
        회원번호: <input type="text" name="memNum" required><br>
        <input type="submit" value="멤버십 취소">
    </form>
    
    <input type="button" onclick="isback()" value="돌아가기">
</body>
</html>
<script>
	function isback() {
		location.href = "u_mypage.jsp";
	}
</script>
