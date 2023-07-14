<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%
	 Connection conn;
	   Statement stmt = null;
	   try {
	      Class.forName("oracle.jdbc.driver.OracleDriver");
	      String db_url = "jdbc:oracle:thin:@localhost:1521:xe";
	      String db_id = "system";
	      String db_pw = "test123";
	      conn = DriverManager.getConnection(db_url, db_id, db_pw);
	      out.println("DB연결 완료");
	      } catch (ClassNotFoundException e){
	         out.println("JDBC 드라이버 로드오류");// "JDBC 드라이버 로드오류"라고 출력해주면 가독성이 좋음.
	      } catch(SQLException e) {
	         out.println("DB 연결 오류");
	      }

	%>
	
	
</body>
</html>