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
				out.println("이름 : " + rs.getString("stu_name") + " , 학번 : " + rs.getString("stu_no") + "입니다.");
				}else{
					out.println("그런 사람 없음");
				}
			}else if(kind.equals("insert")){
				//중복 체크 후 삽입
				rs = stmt.executeQuery("select * from student where stu_no = '"+ stuNo + "'");
				
				if(rs.next()){
						out.println("이미 있는 학번 입니다.");
					}else{
						stmt.executeUpdate("insert into student (stu_no) values ('"+stuNo+"')");
						out.println("삽입 완료");					
				}//insert
			}else if(kind.equals("remove")){
						stmt.executeUpdate("delete from student where stu_no = '"+ stuNo+ "'");
						out.println("삭제 성공.");
					}
		}catch(SQLException e){
			out.println(e.getMessage());
		}
	
	%>
</body>
</html>