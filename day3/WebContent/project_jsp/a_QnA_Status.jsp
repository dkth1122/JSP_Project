<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내용</title>
<style>
   body{
      background-color: #9dc1d8;
   }

</style>
</head>
<body>

<body>
    <%@ include file="jdbc_set.jsp" %>
    
    <%
    request.setCharacterEncoding("UTF-8");
    String a_text = request.getParameter("a_text");
    String a_ticket = request.getParameter("a_ticket");
    String qNo = (String)session.getAttribute("qNo");
    
    
    Statement stmt = null;
   ResultSet rs = null;
    
   try {
       stmt = conn.createStatement();
       String sql = "UPDATE YNY_TB_CHECK SET A_TIME=NOW(), A_CONTENT ='" +a_text+ "', Q_STATUS = '" +a_ticket+ "' WHERE Q_NUM = '" +qNo+ "'";
       int result = stmt.executeUpdate(sql);
       
       if (result == 1) {
           out.println("업데이트완료되었습니다.");
           %>
           <div><input type="button" onclick="back()" value="닫기"></div>
           <%
       }
   } catch (SQLException e) {
       out.println("문제가 발생했습니다.");
       e.printStackTrace();
   } finally {
       try {
           if(rs != null) rs.close();
           if(stmt != null) stmt.close();
       } catch (SQLException e) {
           e.printStackTrace();
       }
   }
    %>

</body>
<script>
   function back() {
      window.close();
      opener.location.reload();
      }
   
</script>
</html>