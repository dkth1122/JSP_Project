<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 멤버십 확인</title>
    <style>
    *{
        font-family: a타이틀고딕2;
    }
    body {
        text-align: center;
        font-size: 24px;
    }
    th {
        background-color: pink;
    }
    table{
        border-collapse: collapse;
    }
    td, th {
        border: 1px solid black;
        padding: 0px 12px;
    }
    .btn{
        width: 50px;
        margin: 10px auto;
    }
    
</style>
</head>
<body>
    <%@ include file="jdbc_set.jsp" %>
    <h1>회원 멤버십 확인</h1>    
    <form name = "list">

    <!-- 입력받은 회원 ID로 조회한 결과가 있을 경우에만 테이블 생성 -->
    <%
        String uId = request.getParameter("uId"); // 입력받은 회원 ID를 가져옴
        if (uId != null && !uId.isEmpty()) { // 입력받은 회원 ID가 null이 아니고 비어있지 않을 경우에만 쿼리 실행
            String sql = "SELECT * FROM YNY_TB_MEMBERSHIP WHERE U_ID = ? ORDER BY U_ID ASC";
            
            ResultSet rs = null;
            PreparedStatement pstmt = null;
    
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, uId);
            rs = pstmt.executeQuery();
    
            if (rs.next()) { // 쿼리 결과가 존재할 때
    %>
    <table border="1">
        <tr>
            <th>선택</th>
            <th>회원 번호</th>
            <th>회원 ID</th>
            <th>등록일</th>
            <th>만료일</th>
            <th>상태</th>
        </tr>
        <% 
            do {
                String memNum = rs.getString("MEM_NUM"); 
                uId = rs.getString("U_ID");
                String rd = rs.getString("REG_DATE");
                String ed = rs.getString("EXP_DATE");
                String st = rs.getString("STATUS");
                String ss = "";
                
                if (st.equals("ACTIVE")){
                	ss = "green";
                }else if(st.equals("CANCELED")){
                	ss = "blue";
                }else if(st.equals("SUSPENDED")){
                	ss = "red";
                }else if (st.equals("EXPIRED")){
                	ss = "gray";
                }
        %>
        <tr>
        	<td>
					<input type="radio" name="user" value="<%=uId%>">
			</td>
            <td><%= memNum %></td>
            <td><%= uId %></td>
            <td><%= rd %></td>
            <td><%= ed %></td>
            <td style="color:<%= ss%>"><%= st %></td>
        </tr>
        <% 
            } while (rs.next());
        %>
    </table>
    <% 
            } else {
                out.println("<p>멤버십 회원이 없습니다.</p>");
            }

            pstmt.close();
            rs.close();
        } else {
            out.println("<p>회원 ID를 입력해주세요.</p>");
        }
    %>
    <input type="button" onclick="mUpdate()" value="수정"/>
	<input type="button" onclick="mRemove()" value="삭제"/>
    </form>
    <input type="button" onclick="isback()" value="돌아가기"/>
</body>
</html>
<script>
    function isback() {
        location.href = "a_mem.jsp";
    }
    
    function mUpdate(){
		   if (!confirm("정말 수정하시겠습니까?")) {
		      return;
		   }
		   var form = document.list;
		   window.open("a_mem_update.jsp?uId=" + form.user.value,"mupop","width=500, height=300");
		}
	
	function mRemove(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		   var form = document.list;
		   window.open("a_mem_remove.jsp?uId=" + form.user.value,"mrpop","width=500, height=300")
	}
	function getReturn(){
		location.reload(); //새로고침
	}	
</script>
