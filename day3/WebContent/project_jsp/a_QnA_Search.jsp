<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   body{
      background-color: #9dc1d8;
   }
        table, th, td{
            border: 1px solid black;
            border-collapse: collapse;
        }
        th, td { 
        padding: 10px 20px;
        text-align: center;
        }
        .but1{
           position: relative;
           left: 180px;
           margin-top: 20px;
           margin-left: 20px;
           width: 100px;
           height: 50px;
        }
        
    </style>
</head>
<body>
<%@ include file="jdbc_set.jsp" %>
<form name="list">
   <table>
      <tr>
         <th>문의번호</th>
         <th>아이디</th>
         <th>제목</th>
         <th>문의 시간</th>
         <th>티켓 상태</th>
         <th>답변 및 수정</th>
      </tr>
      <%  String uId = request.getParameter("uId");
            session.setAttribute("uId", uId);
            
         ResultSet rs = null;
         Statement stmt = null;
         try {
            String sql = "SELECT * FROM YNY_TB_CHECK WHERE U_ID ='" + uId +"' ORDER BY Q_STATUS DESC";
            stmt = conn.createStatement();
            rs = stmt.executeQuery(sql);
            while (rs.next()) {
               int qNo = rs.getInt("Q_NUM");
               String qTime = rs.getString("Q_TIME");
               String qTitle = rs.getString("Q_TITLE");
               String aCon = rs.getString("Q_STATUS");
               String aChe
               = rs.getString("Q_STATUS").equals("C")? "수정":"답변";
               String qSty;
               if(rs.getString("Q_STATUS").equals("C")){
                   qSty = "black";
               }else if(rs.getString("Q_STATUS").equals("P")){
                   qSty = "blue";
               }else{
                   qSty = "red";
               };
            
      %>
         <tr>
            <td style="color:<%= qSty %>"><%=qNo%></td>
            <td style="color:<%= qSty %>"><%=uId%></td>
            <td style="color:<%= qSty %>"><%=qTitle%></td>
            <td style="color:<%= qSty %>"><%=qTime%></td>
            <td style="color:<%= qSty %>"><%=aCon%></td>
            <td><input type="button" value="<%= aChe %>" onclick="qq_a(<%=qNo%>)"></td>
            
         </tr>
         
      <%
            }
         } catch (SQLException ex) {
            out.println("Member 테이블 호출이 실패했습니다.<br>");
            out.println("SQLException: " + ex.getMessage());
         } 
      %>
      
   </table>

   <div><input type="button" onclick="isback()" value="되돌아가기"></div>
</form>
</body>
</html>
<script>
   var form = document.list;

	function isback() {
	      window.close();
	      opener.location.reload();
            }

	function qq_a(qNo) {
               window.open("a_QnA_Answer.jsp?qNo=" + qNo,"popup1"
                   ,"width=500, height=500");
            }
</script>