<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 멤버십 확인</title>
<style>
	@font-face {
        font-family: "삼립호빵";
        src: url("./img/SDSamliphopangcheTTFOutline.ttf") format("truetype");
    }
    
    @font-face {
        font-family: "a타이틀고딕2";
        src: url("./img/A타이틀고딕2.TTF") format("truetype");
    }
	*{
		font-family: a타이틀고딕2;
	}
	body {
		background-color:#e8ffef;
		text-align: center;
		font-size: 16px;
		color: #ggg;
	}
	th {
		background-color: #fdfdd3;
		color: rgb(255, 99, 146);
	}
	table{
		border-collapse: collapse;
		margin: 10px auto;
	}
	td, th {
		border: 1px solid pink;
		padding: 3px;
	}
	.btn{
		width: 50px;
		margin: 10px auto;
	}
	td{
		background-color: white;
	}
	.btn_input{
		width: 100px;
		height: 24px;
		font-size: 15px;
		font-family: a타이틀고딕2;
		color:rgb(255, 99, 146);
		border-radius: 30px;
		border:1px solid pink;
		background-color: #fdfdd3;
		cursor: pointer;
		}
	input{
		margin: 5px;
		border: 1px solid pink;
		color: rgb(255, 99, 146);
	}
	input:focus { 
		outline: none !important; border-bottom-color: pink; box-shadow: 0 0 10px #d6a8e9; 
	}
</style>
</head>
<body>
    <%@ include file="jdbc_set.jsp" %>
    <h1 style="color: rgb(255, 99, 146)">회원 멤버십 확인</h1>    
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
    <input class="btn_input" type="button" onclick="mUpdate()" value="수정"/>
	<input class="btn_input"  type="button" onclick="mRemove()" value="삭제"/>
    <input class="btn_input"  type="button" onclick="isback()" value="돌아가기"/>
    </form>
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
