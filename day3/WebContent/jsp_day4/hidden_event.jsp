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
	<%@ include file="../jsp_day3/jdbc_set.jsp"%>
	<% request.setCharacterEncoding("EUC-KR"); %>

	<%
		String stuNo = request.getParameter("stuNo");
		String kind = request.getParameter("btnKind");
		
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			stmt = conn.createStatement();
			
			if(kind.equals("search")){
				String sql = "select * from student where stu_no = '"+ stuNo + "'" ;			
				rs = stmt.executeQuery(sql);
				if(rs.next()){
				out.println("�̸� : " + rs.getString("stu_name") + " , �й� : " + rs.getString("stu_no") + "�Դϴ�.");
				}else{
					out.println("�׷� ��� ����");
				}
			}else if(kind.equals("insert")){
				//�ߺ� üũ �� ����
				rs = stmt.executeQuery("select * from student where stu_no = '"+ stuNo + "'");
				
				if(rs.next()){
						out.println("�̹� �ִ� �й� �Դϴ�.");
					}else{
						stmt.executeUpdate("insert into student (stu_no) values ('"+stuNo+"')");
						out.println("���� �Ϸ�");					
				}//insert
			}else if(kind.equals("remove")){
						stmt.executeUpdate("delete from student where stu_no = '"+ stuNo+ "'");
						out.println("���� ����.");
					}
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	
	%>
</body>
</html>