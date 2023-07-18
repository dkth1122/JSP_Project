<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.text.ParseException" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>멤버십 취소 처리</title>
</head>
<body>
    <%@ include file="jdbc_set.jsp" %>
    <%
        request.setCharacterEncoding("UTF-8");
        
        String memNum = request.getParameter("memNum");
        
        try {
            // 기존 멤버십 정보 조회
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM YNY_TB_MEMBERSHIP WHERE MEM_NUM = ?");
            pstmt.setInt(1, Integer.parseInt(memNum));
            ResultSet rs = pstmt.executeQuery();
            
            if (rs.next()) {
                String status = rs.getString("STATUS");
                String expDateStr = rs.getString("EXP_DATE");
                
                // 현재 날짜와 만료일 비교
                java.util.Date now = new java.util.Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
                java.util.Date expDate = sdf.parse(expDateStr);
                
                if (now.after(expDate)) {
                    // 만료일이 지났으면 멤버십 상태를 "EXPIRED"로 업데이트
                    PreparedStatement updatePstmt = conn.prepareStatement("UPDATE YNY_TB_MEMBERSHIP SET STATUS = 'EXPIRED' WHERE MEM_NUM = ?");
                    updatePstmt.setInt(1, Integer.parseInt(memNum));
                    updatePstmt.executeUpdate();
                    updatePstmt.close();
                } else {
                    // 만료일이 아직 지나지 않았으면 취소 상태로 업데이트
                    PreparedStatement updatePstmt = conn.prepareStatement("UPDATE YNY_TB_MEMBERSHIP SET STATUS = 'CANCELED' WHERE MEM_NUM = ?");
                    updatePstmt.setInt(1, Integer.parseInt(memNum));
                    updatePstmt.executeUpdate();
                    updatePstmt.close();
                }
            } else {
                // 해당 회원번호로 등록된 멤버십이 없는 경우
    %>
                <script>
                    alert("해당 회원번호로 등록된 멤버십이 없습니다.");
                    history.back(); // 이전 페이지로 돌아가기
                </script>
    <%
            }
            
            pstmt.close();
            conn.close();
            
            // 멤버십 취소 처리 완료 시 메인 페이지로 이동
            response.sendRedirect("u_mypage.jsp");
        } catch (ParseException e) {
            out.println("ParseException: " + e.getMessage());
        } catch (SQLException e) {
            out.println("SQLException: " + e.getMessage());
        }
    %>
</body>
</html>
