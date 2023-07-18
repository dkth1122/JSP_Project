<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.Calendar" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>멤버십 추가 처리</title>
</head>
<body>
    <%@ include file="jdbc_set.jsp" %>
    <%
        request.setCharacterEncoding("UTF-8");
        
        int subscriptionMonths = Integer.parseInt(request.getParameter("subscriptionMonths"));
        String uId = (String)session.getAttribute("uId");
        
        try {
            // 멤버십 구독 여부 확인
            PreparedStatement checkStmt = conn.prepareStatement("SELECT EXP_DATE FROM YNY_TB_MEMBERSHIP WHERE U_ID = ? ORDER BY EXP_DATE DESC LIMIT 1");
            checkStmt.setString(1, uId);
            ResultSet rs = checkStmt.executeQuery();
            
            java.sql.Timestamp now = new java.sql.Timestamp(new java.util.Date().getTime());
            java.sql.Timestamp expirationDate;
            String status = "ACTIVE";
            
            if (rs.next()) {
                // 멤버십 구독 정보가 이미 존재하는 경우, 기존 만료일을 가져와서 연장
                java.sql.Timestamp lastExpirationDate = rs.getTimestamp("EXP_DATE");
                
                Calendar cal = Calendar.getInstance();
                cal.setTime(lastExpirationDate);
                cal.add(Calendar.MONTH, subscriptionMonths);
                expirationDate = new java.sql.Timestamp(cal.getTimeInMillis());
            } else {
                // 멤버십 구독 정보가 없는 경우, 현재 시간을 기준으로 등록일과 만료일 설정
                expirationDate = now;
                
                Calendar cal = Calendar.getInstance();
                cal.setTime(expirationDate);
                cal.add(Calendar.MONTH, subscriptionMonths);
                expirationDate = new java.sql.Timestamp(cal.getTimeInMillis());
            }
            
            // 멤버십 추가 또는 연장 처리
            PreparedStatement pstmt = conn.prepareStatement("INSERT INTO YNY_TB_MEMBERSHIP (U_ID, REG_DATE, EXP_DATE, STATUS) VALUES (?, ?, ?, ?) ON DUPLICATE KEY UPDATE EXP_DATE = ?");
            pstmt.setString(1, uId);
            pstmt.setTimestamp(2, now);
            pstmt.setTimestamp(3, expirationDate);
            pstmt.setString(4, status);
            pstmt.setTimestamp(5, expirationDate);
            pstmt.executeUpdate();
            pstmt.close();
            conn.close();
            
            // 멤버십 추가 또는 연장 성공 시 마이페이지로 이동
            response.sendRedirect("u_mypage.jsp");
        } catch (SQLException e) {
            out.println("SQLException: " + e.getMessage());
        }
    %>
</body>
</html>
