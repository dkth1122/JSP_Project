<%@page import="org.eclipse.jdt.internal.compiler.batch.Main"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login check page</title>
</head>
<body>
<%@ include file="../jsp_day3/jdbc_set.jsp" %>
<%

	request.setCharacterEncoding("UTF-8");
	String uId = request.getParameter("uid");
	String pwd = request.getParameter("pwd1");
	String stat = request.getParameter("stat");
	
	ResultSet rs = null; // 검색 결과를 담기 위한 객체
	Statement stmt = null; // 쿼리 호출을 위한 객체
	
	try{		
				stmt = conn.createStatement();
				String sql = "SELECT * FROM TBL_USER WHERE U_ID = '"+uId+"' AND PWD = '"+pwd +"' AND STATUS ='" +stat + "'";
				rs = stmt.executeQuery(sql);

					
				if(rs.next()){
					
					if(rs.getString("BANYN").equals("Y")){
						out.println("정지된 회원 입니다. 앞으로 잘하세용");
%>
					<div><button onclick="isback()">되돌아가기</button></div>
<% 					
					}else if(rs.getInt("CNT") >= 5){
						out.println("비밀번호를 5회 이상 틀려씁니다. 관리자에게 문의주세용");		
%>
						<div><button onclick="isback()">되돌아가기</button></div>
						
<%
					}else{									
						session.setAttribute("id", uId);
						session.setAttribute("uname", rs.getString("U_NAME"));
						session.setAttribute("status", rs.getString("STATUS"));
						
						String nupdate = "UPDATE TBL_USER SET CNT= 0 WHERE U_ID = '"+ uId+"'";
						stmt.executeUpdate(nupdate); 
						
							if(stat.equals("U")){
								response.sendRedirect("main.jsp");
							}else if(stat.equals("A")){
								response.sendRedirect("user.jsp");
							}else{
								out.println("알맞은 값을 체크하시오");
							}
					}//else
					
			}else {
				String sss = "SELECT * FROM TBL_USER WHERE U_ID = '"+uId+"'";
				rs = stmt.executeQuery(sss);
				
					if(rs.next()){
						if(rs.getInt("CNT") >= 5){
							out.println("비밀번호를 5회 이상 틀려씁니다. 관리자에게 문의주세용");		
	%>
							<div><button onclick="isback()">되돌아가기</button></div>
	<%
						}else{
							sql = "SELECT * FROM TBL_USER WHERE U_ID = '" + uId + "'";
							rs = stmt.executeQuery(sql);
							if(rs.next()){
								if(rs.getInt("CNT") >= 5){ // 5번 이상 실패
									out.println("비밀번호 5번 이상 실패! 관리자 한테 문의하셈");
								} else {
									String update = "UPDATE TBL_USER SET CNT = CNT + 1 WHERE U_ID = '" + uId + "'";
									stmt.executeUpdate(update);
									response.sendRedirect("find.jsp");
										}//in-else
								}//rs.next-if
						}//else
					}//out-rs.next_if
			}//else
	}catch(SQLException e){
			out.println(e.getMessage());
	}//catch
	
	%>
</body>
</html>
<script>
	function isback() {
		location.href = "login_m.jsp"
	}

</script>
