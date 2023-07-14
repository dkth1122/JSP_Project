<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	Connection conn;
	Class.forName("com.mysql.jdbc.Driver"); 
	String db_url = "jdbc:mysql://db-hedhk.pub-cdb.ntruss.com/tj-db1?verifyServerCertificate=false&useSSL=false&requireSSL=false";
	String db_id = "tj_test2";
	String db_pw = "test12#$";
	conn = DriverManager.getConnection(db_url, db_id, db_pw);

	%>
</body>
</html>
​