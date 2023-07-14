<%@page import="javax.websocket.OnClose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
﻿<script src="../js/code.jquery.com_jquery-3.7.0.min.js"></script>
<style>
	body {
		text-align: center;
		font-family: a타이틀고딕2;
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
</style>
</head>
<body>
<form name="list" action="jdbc_radio_input.jsp">
<input name="stuNo" hidden/>
	<%@ include file="../jsp_day3/jdbc_set.jsp"%>
	<%
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from student");
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>체크</th>");	
		out.println("<th>이름</th>");
		out.println("<th>학번</th>");
		out.println("<th>학과</th>");		
		out.println("</tr>");
		
		while(rs.next()){			
			out.println("<tr>");
%>
			<td><input type='radio' name='stu' value= <%= rs.getString("stu_No") %>/></td>
	
<% 		out.println("<td>" + rs.getString("STU_NAME") + "</td>");
			out.println("<td>" + rs.getString("STU_NO") + "</td>");
			out.println("<td>" + rs.getString("STU_DEPT") + "</td>");
			out.println("</tr>");
			}

			out.println("</table>");
		
		 rs.close();		 
%>

<input type ="button" onclick="update()" value="수정"/>
</form>
</body>
</html>
<script>
	function update() {
		let form = document.list;
		$("input:radio[name=stu]:checked").each(function (i, val) {
			form.stuNo.value = val.value;
			form.submit();
		});
	}

</script>