
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<%@ include file="jdbc_set.jsp"%>
	<% request.setCharacterEncoding("EUC-KR"); %>

	<% 
			String stuNo = request.getParameter("stuNo");
			String stuDept = request.getParameter("stuDept");
			String stuGrade = request.getParameter("stuGrade");
			
			Statement stmt = conn.createStatement();
			ResultSet rs = stmt.executeQuery("select * from student where stu_no = '" + stuNo + "'");

			while(rs.next()){
				if(rs.getString("stu_no").trim().equals(stuNo) && rs.getString("stu_dept").equals(stuDept)&& rs.getString("stu_grade").equals(stuGrade)){
					stmt.executeUpdate("delete from student where stu_no = '"+ stuNo+ "'");
					out.println("STUDENT ���̺� ���� �����߽��ϴ�.");
				}else if(rs.getString("stu_no").trim().equals(stuNo)){
					stmt.executeUpdate("UPDATE student set stu_dept = '"+stuDept+"', stu_grade = '"+stuGrade+"' where stu_no = '"+stuNo+"'");
					out.println("STUDENT ���̺� ������Ʈ �����߽��ϴ�.");
				}else{ 
					out.println("���� �����");
				}
			}
			rs.close();
	%>

</body>
</html>