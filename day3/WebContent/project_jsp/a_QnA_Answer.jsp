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
   <%@ include file="jdbc_set.jsp" %>
   
   <% 
      request.setCharacterEncoding("UTF-8");
      String qNo = request.getParameter("qNo");
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      session.setAttribute("qNo", qNo);
      
      try {
         String sql = "SELECT * FROM YNY_TB_CHECK WHERE Q_NUM = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, Integer.parseInt(qNo));
         rs = pstmt.executeQuery();
         
         if (rs.next()) {
            String qTitle = rs.getString("Q_TITLE");
            String qContent = rs.getString("Q_CONTENT");
            String content2 = rs.getString("A_CONTENT");
            if (content2 == null) {
               content2 = "내용없음";
            }
            %>
            <div>문의 제목 : <%= qTitle %></div>
            <div>문의 내용 : <%= qContent %></div>
            <form action="a_QnA_Status.jsp" name="inquiry_form">
               <div>
                  답변 내용 : <input type="text" name="a_text" value="<%= content2 %>">
                  <select name="a_ticket">
                     <option value="" selected>티켓상태</option>
                     <option value="O">OPEN</option>
                     <option value="P">PENDING</option>
                     <option value="C">CLOSE</option>
                  </select>
               </div>
               <input type="button" onclick="answer();" value="답변하기">
            </form>
            <%
         } else {
            out.println("문의 내용을 조회할 수 없습니다.");
         }
         
      } catch (SQLException e) {
         out.println("문의 내용 조회 중 오류가 발생했습니다.<br>");
         out.println("SQLException: " + e.getMessage());
      }
   %>
</body>
<script>
   function answer() {
        var form = document.inquiry_form;
        if (form.a_ticket.value == "") {
          alert("티켓 상태를 설정해주세요.");
          form.a_ticket.focus();
        } else {
        form.submit();
      }
   }
</script>
</html>
