	<%@page import="org.eclipse.jdt.internal.compiler.batch.Main"%>
	<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	<%@ page import="java.sql.*" %>
	<!DOCTYPE html>
	<html>
	<head>
	<meta charset="UTF-8">
	<title>Login check page</title>
	</head>
	<body>
	<%@ include file="jdbc_set.jsp" %>
	<%
	
		request.setCharacterEncoding("UTF-8");
		String uId = request.getParameter("uid");
		String pwd = request.getParameter("pwd1");
		String stat = request.getParameter("stat");
		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		
		try{		
			stmt = conn.createStatement();
			String sql = "SELECT * FROM YNY_TB_USER WHERE U_ID = '"+uId+"' AND PWD = '"+pwd +"' AND STATUS ='" +stat + "'";
			rs = stmt.executeQuery(sql);
	
			if(rs.next()){
				if(rs.getString("BANYN").equals("Y")){
					out.println("정지된 회원 입니다.");
	%>
					<div><button onclick="isback()">되돌아가기</button></div>
	<% 					
				}else if(rs.getInt("CNT") >= 5){
					out.println("비밀번호를 5회 이상 틀렸습니다. 관리자에게 문의주세요.");		
	%>
					<div><button onclick="isback()">되돌아가기</button></div>
	<%
				}else{									
					session.setAttribute("id", uId);
					session.setAttribute("uname", rs.getString("U_NAME"));
					session.setAttribute("status", rs.getString("STATUS"));
					
					String nupdate = "UPDATE YNY_TB_USER SET CNT= 0 WHERE U_ID = '"+ uId+"'";
					stmt.executeUpdate(nupdate); 
					
					if(stat.equals("U")){
						response.sendRedirect("u_login_success.jsp");
					}else if(stat.equals("A")){
						response.sendRedirect("a_home.jsp");
					}else{
						out.println("알맞은 값을 체크하시오");
					}
				}//else
			}else {
				String sss = "SELECT * FROM YNY_TB_USER WHERE U_ID = '"+uId+"'";
				rs = stmt.executeQuery(sss);
				
				if(rs.next()){
					if(rs.getInt("CNT") >= 5){
						out.println("비밀번호를 5회 이상 틀렸습니다. 관리자에게 문의주세요.");		
	%>
						<div><button onclick="isback()">되돌아가기</button></div>
	<%
					}else{
						sql = "SELECT * FROM YNY_TB_USER WHERE U_ID = '" + uId + "'";
						rs = stmt.executeQuery(sql);
						if(rs.next()){
							if(rs.getInt("CNT") >= 5){ // 5번 이상 실패
								out.println("비밀번호 5번 이상 실패! 관리자에게 문의하세요.");
							} else {
								String update = "UPDATE YNY_TB_USER SET CNT = CNT + 1 WHERE U_ID = '" + uId + "'";
								stmt.executeUpdate(update);
								response.sendRedirect("u_login_fail.jsp");
							}//in-else
						}//rs.next-if
					}//else
				}else {
					// 아이디로 검색한 결과가 없는 경우에도 로그인 실패 페이지로 이동
					response.sendRedirect("u_login_fail.jsp");
				}
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
