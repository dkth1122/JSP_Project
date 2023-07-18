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
    
    <form action="a_mem_process.jsp" method="post">
        회원 ID: <input type="text" name="uId" required>
        <input type="submit" value="검색">
    </form>
    

    <table border="1">
        <tr>
            <th>회원 ID</th>
            <th>멤버십 종류</th>
            <th>등록일</th>
            <th>만료일</th>
            <th>상태</th>
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
        %>
            <tr>
                <td><%= memNum %></td>
                <td><%= uId%></td>
                <td><%= rd %></td>
                <td><%= ed %></td>
                <td><%= st %></td>
            </tr>
        <%  } %>
    </table>
    <input type="button" onclick="isback()" value="돌아가기"/>
</body>
</html>
<script>
	function isback() {
		location.href = "a_home.jsp";
	}
</script>
