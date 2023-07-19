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
            // 회원 탈퇴 요청 처리 전, 회원 정보와 멤버십 정보를 조인하여 상태를 확인
            PreparedStatement pstmt = conn.prepareStatement("SELECT U.U_ID, M.STATUS FROM YNY_TB_USER U LEFT JOIN YNY_TB_MEMBERSHIP M ON U.U_ID = M.U_ID WHERE U.U_ID = ?");
            pstmt.setString(1, uId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String status = rs.getString("STATUS");

                if ("CANCELED".equals(status)) {
                    // 회원 탈퇴 요청 처리 (BANYN 컬럼을 'S'로 업데이트)
                    PreparedStatement updateStmt = conn.prepareStatement("UPDATE YNY_TB_USER SET BANYN = 'S' WHERE U_ID = ?");
                    updateStmt.setString(1, uId);
                    updateStmt.executeUpdate();
                    updateStmt.close();

                    // 회원 탈퇴 요청 성공 시 메인 페이지로 이동
                    %>
                    <div>회원 탈퇴가 완료되었습니다.</div>
                    <div><input type="button" onclick="isback()" value="돌아가기"></div>
                    <%
                } else {
                    // 회원 탈퇴 불가능 상태일 경우 메시지 출력 등 처리
                    %>
                    <div>회원 탈퇴가 불가능한 상태입니다. 멤버쉽 구독을 해지해주세요.</div>
                    <div><input type="button" onclick="isback()" value="돌아가기"></div>
                    <%
                }
            } else {
                // 해당 회원 정보가 존재하지 않을 경우 메시지 출력 등 처리
                %>
                <div>해당 회원 정보가 존재하지 않습니다.</div>
                <div><input type="button" onclick="isback()" value="돌아가기"></div>
                <%
            }

            rs.close();
            pstmt.close();
            conn.close();
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
