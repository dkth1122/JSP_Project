<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Member Remove</title>
</head>
<body>
    <%@ include file="jdbc_set.jsp" %>
<%
    request.setCharacterEncoding("UTF-8");
    String uId = request.getParameter("uId");
    Statement stmt = null;

    try {
        if (uId != null && !uId.isEmpty()) {
            stmt = conn.createStatement();
            String select = "SELECT * FROM YNY_TB_MEMBERSHIP WHERE U_ID = '" + uId + "'";
            ResultSet rs = stmt.executeQuery(select);
            if (rs.next()) {
                if ("CANCELED".equals(rs.getString("STATUS"))) {
                    String delete = "DELETE FROM YNY_TB_MEMBERSHIP WHERE U_ID = '" + uId + "'";
                    stmt.executeUpdate(delete);
                    out.println("삭제되었습니다.");
                } else {
                    out.println("해당 회원은 멤버쉽을 취소 신청하지 않아 삭제처리할 수 없습니다.");
                }
            } else {
                out.println("해당 회원의 멥버십 정보가 존재하지 않습니다.");
            }
        } else {
            out.println("아이디를 입력해주세요.");
        }
    } catch (SQLException ex) {
        out.println("SQLException: " + ex.getMessage());
    } finally {
        if (stmt != null) {
            try {
                stmt.close();
            } catch (SQLException ex) {
                out.println("SQLException: " + ex.getMessage());
            }
        }
    }
%>
    <input type="button" onclick="back()" value="되돌아가기">
</body>
</html>
<script>
    function back() {
        window.opener.getReturn();
        window.close();
    }
</script>
