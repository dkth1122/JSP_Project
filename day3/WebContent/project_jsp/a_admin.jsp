<%@page import="java.rmi.server.UID"%>
<%@page import="javax.websocket.OnClose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
﻿<script src="../js/code.jquery.com_jquery-3.7.0.min.js"></script>
<style>
	*{
		font-family: a타이틀고딕2;
	}
	body {
		text-align: center;
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
	.btn{
		width: 50px;
		margin: 10px auto;
	}
	
</style>
</head>
<body>
<%@ include file="jdbc_set.jsp"%>
<form name="list" action="user_update">
	<table>
		<tr>
			<th>선택</th>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰번호</th>
			<th>나이</th>
			<th>주소</th>
			<th>정지여부</th>
			<th>기능</th>
			<th>시도횟수</th>
			<th>시도 횟수 초기화</th>
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			try {
				String sql = "select * from YNY_TB_USER WHERE STATUS = 'U' ORDER BY U_ID ASC";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					String uId = rs.getString("U_ID");
					String uName = rs.getString("U_NAME");
					String phone 
						= rs.getString("PHONE") != null ? rs.getString("PHONE") : "-";
					String age 
						= rs.getString("AGE")  != null ? rs.getString("AGE") : "-";
					String addr
						= rs.getString("ADDR")  != null ? rs.getString("ADDR") : "-";
					String banYn 
						= rs.getString("BANYN").equals("Y") ? "정지" : "";
					String ban 
						= rs.getString("BANYN").equals("Y") ? "해제" : "정지";
					int cnt
						= rs.getInt("CNT");
					String cnt2
						= rs.getInt("CNT") >= 5 ? "button" : "hidden";
		
		%>
			<tr>
				<td>
					<input type="radio" name="user" value="<%=uId%>">
				</td>
				<td><%=uId%></td>
				<td><%=uName%></td>
				<td><%=phone%></td>
				<td><%=age%></td>
				<td><%=addr%></td>
				<td style="color:red"><%=banYn%></td>
				<td><input style="margin-bottom: 7px;"  type="button" onclick="bchange('<%=rs.getString("BANYN")%>', '<%=uId %>')" value=<%= ban %>></td>
				<td><%=cnt%></td>
				<td><input style="margin-bottom: 7px;"  type=<%= cnt2 %> onclick="cnt('<%=uId %>')" value="초기화"></td>
			</tr>
			
		<%
			}
			} catch (SQLException ex){
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
		%>
	</table>
	<input type="button" onclick="userUpdate()" value="수정"/>
	<input type="button" onclick="userRemove()" value="삭제"/>
</form>
</body>
</html>
<script>
	var form = document.list;
		function userRemove(){
			if(!confirm("정말 삭제하시겠습니까?")){
				return;
			}
			location.href = "a_user_remove.jsp?uId=" + form.user.value;
		}//userRemove
		
		function bchange(kind,uId){
					if(kind == "N"){
						kind ="Y";
					}else {
						kind = "N"
					}
					window.open("a_user_ban.jsp?uId="+uId+"&kind="+kind,"bpop","width=500, height=300");	
				}//stopop
				
		function getReturn(){
					location.reload(); //새로고침
				}		
				
		function cnt(uId){
			window.open("a_cnt_reset.jsp?uId="+uId,"cpop","width=500, height=300");	
		}		
		
		function userUpdate(){
			   if (!confirm("정말 수정하시겠습니까?")) {
			      return;
			   }
			   var form = document.list;
			   window.open("a_user_update.jsp?uId=" + form.user.value,"upop","width=500, height=300");
			}
		
</script>