
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
			String kind = request.getParameter("kind");
			

			Statement stmt = conn.createStatement();
			
			if(kind.equals("search")){
				ResultSet rs = stmt.executeQuery("select count(*) as cnt from student where stu_no = '" + stuNo + "'");
				rs.next();
				int cnt = Integer.parseInt(rs.getString("cnt"));
				
				if(cnt == 1){
					out.println("�̹� �ִ� �й� �Դϴ�.");
				}else{
					out.println(rs.getString("stu_name") + "�л� �Դϴ�.");
				}//else
				rs.close();
			}//search
			
			
			else if (kind.equals("insert")){
				stmt.executeUpdate("insert into student (stu_no) values ('"+stuNo+"')");
				out.println("STUDENT ���̺� ���� �����߽��ϴ�.");
			}
			
			else if(kind.equals("remove")){
				stmt.executeUpdate("delete from student where stu_no = '"+ stuNo+ "'");
				out.println("STUDENT ���̺� ���� �����߽��ϴ�.");
			}
	%>

</body>
</html>