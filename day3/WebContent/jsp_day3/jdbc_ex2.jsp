<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	body {
		text-align: center;
		font-family: aŸ��Ʋ���2;
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
	<%@ include file="jdbc_set.jsp"%>
	<%
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from student");
		
		out.println("<table>");
		out.println("<tr>");
		out.println("<th>�̸�</th>");
		out.println("<th>�й�</th>");
		out.println("<th>�а�</th>");		
		out.println("</tr>");
		
		while(rs.next()){			
			out.println("<tr>");
			out.println("<td>" + rs.getString("STU_NAME") + "</td>");
			out.println("<td>" + rs.getString("STU_NO") + "</td>");
			out.println("<td>" + rs.getString("STU_DEPT") + "</td>");
			out.println("</tr>");
			}

			out.println("</table>");
		
		 rs.close();
	%>

</body>
</html>