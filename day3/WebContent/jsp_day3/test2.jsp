
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
					out.println("이미 있는 학번 입니다.");
				}else{
					out.println(rs.getString("stu_name") + "학생 입니다.");
				}//else
				rs.close();
			}//search
			
			
			else if (kind.equals("insert")){
				stmt.executeUpdate("insert into student (stu_no) values ('"+stuNo+"')");
				out.println("STUDENT 테이블 삽입 성공했습니다.");
			}
			
			else if(kind.equals("remove")){
				stmt.executeUpdate("delete from student where stu_no = '"+ stuNo+ "'");
				out.println("STUDENT 테이블 삭제 성공했습니다.");
			}
	%>

</body>
</html>