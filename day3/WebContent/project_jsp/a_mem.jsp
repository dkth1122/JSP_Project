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
    
    <form action="a_mem_Search.jsp" method="post">
        회원 ID: <input type="text" name="uId" required>
        <input type="submit" value="검색">
    </form>
    

<form name = "list">
    <table border="1">
        <tr>
        	<th>선택</th>
            <th>회원 ID</th>
            <th>아이디</th>
            <th>등록일</th>
            <th>만료일</th>
            <th>상태</th>
            <th>수정일</th>
        </tr>

        <%
       		String sql = "SELECT * FROM YNY_TB_MEMBERSHIP ORDER BY U_ID ASC";
			
			ResultSet rs = null;
			Statement stmt = null;
        
        	stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
        
        while (rs.next()) { 
        	String memNum = rs.getString("MEM_NUM"); 
        	String uId = rs.getString("U_ID");
        	String rd = rs.getString("REG_DATE");
        	String ed = rs.getString("EXP_DATE");
        	String st = rs.getString("STATUS");
        	String ud = rs.getString("UP_D") != null ? rs.getString("UP_D") : "-";
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
                <td><%= uId%></td>
                <td><%= rd %></td>
                <td><%= ed %></td>
                <td style="color:<%= ss%>"><%= st %></td>
                <td><%= ud %></td>
            </tr>
        <%  } %>
    </table>
    <input type="button" onclick="mUpdate()" value="수정"/>
	<input type="button" onclick="mRemove()" value="삭제"/>
   </form>
    <input type="button" onclick="isback()" value="돌아가기"/>
</body>
</html>
<script>
	function isback() {
		location.href = "a_home.jsp";
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
