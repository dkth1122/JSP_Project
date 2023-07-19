<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   @font-face {
        font-family: "a타이틀고딕2";
        src: url("./img/A타이틀고딕2.TTF") format("truetype");
    }

	*{
		color:rgb(255, 99, 146);
		font-family: a타이틀고딕2;
		font-size: 32px;
	}

	body {
		margin: 0px 0px;
		background-color: #fdfdd3;
	}
	
	.btn_input {
		width: 200px;
	  	height: 40px;
		font-size: 24px;
		font-family: a타이틀고딕2;
		color:rgb(255, 99, 146);
		border-radius: 30px;
		border:1px solid pink;
		background-color: white;
		cursor: pointer;
		margin: 24px 75px;
	}
</style>
</head>
<body>
    <%@ include file="jdbc_set.jsp" %>
    
    <%
    String uId = (String) session.getAttribute("uId");
    session.setAttribute("uId", uId);
    request.setCharacterEncoding("UTF-8");
    String tit = request.getParameter("tit");
    String cont = request.getParameter("cont");
    
    try {
        String sql1 = "INSERT INTO YNY_TB_CHECK (Q_NUM, U_ID, Q_TIME, Q_TITLE, Q_CONTENT, Q_STATUS) VALUES (?, ?, ?, ?, ?, ?)";
        
        // 현재 시간 구하기 (MySQL에서는 NOW() 대신에 자바 코드로 현재 시간을 가져옴)
        java.sql.Timestamp currentTime = new java.sql.Timestamp(System.currentTimeMillis());

        String sql2 = "SELECT MAX(Q_NUM) FROM YNY_TB_CHECK";
        PreparedStatement pstmt2 = conn.prepareStatement(sql2);
        ResultSet rs = pstmt2.executeQuery();
        
        int a = 0;
        if (rs.next()) {
            a = rs.getInt("MAX(Q_NUM)");
        }
        PreparedStatement pstmt = conn.prepareStatement(sql1);
   
        pstmt.setInt(1, (a + 1));
        pstmt.setString(2, uId);
        pstmt.setTimestamp(3, currentTime); // 현재 시간 설정
        pstmt.setString(4, tit);
        pstmt.setString(5, cont);
        pstmt.setString(6, "O");
        pstmt.executeUpdate();
        out.println("<div style='margin:24px 32px; background-color:white; width: 300px; border:1px solid pink; text-align:center;'> 문의 등록 완료 </div>");
        %>
        <div><input class="btn_input" type="button" onclick="isback()" value="돌아가기"></div>
        <%
        pstmt.close();
        pstmt2.close();
        rs.close();
    } catch(SQLException e) {
    	out.println(e.getMessage());
        out.println("<div style='margin:24px 32px; background-color:white; width: 300px; border:1px solid pink; text-align:center;'>문제가 발생했습니다. 관리자에게 문의하세요.</div>");
        e.printStackTrace();
        %>
        <div><input type="button" onclick="isback()" value="돌아가기"></div>
        <%
    }
    %>

</body>
<script>
   function isback() {
    location.href = "u_QnA.jsp"
      }
</script>
</html>
