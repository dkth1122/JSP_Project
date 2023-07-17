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

<form name="searchForm" method="get" action="">
  <label for="searchId">검색할 아이디:</label>
  <input type="text" id="searchId" name="searchId">
  <input type="button" onclick="searchUser()" value="검색">
</form>

<form name="list" action="a_user_update.jsp">
	<table>
		<tr>
			<th>선택</th>
			<th>문의 번호</th>
			<th>아이디</th>
			<th>문의 날짜</th>
			<th>제목</th>
			<th>문의 상태</th>
			<th>확인</th>
		</tr>
		<%
			ResultSet rs = null;
			Statement stmt = null;
			try {
				String sql = "SELECT * FROM YNY_TB_USER U lEFT JOIN YNY_TB_CHECK C ON U.U_ID = C.U_ID WHERE STATUS = 'U' AND Q_NUM IS NOT NULL ORDER BY Q_NUM ASC";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while (rs.next()) {
					String uId = rs.getString("U_ID");
			
					String qna_d
					= rs.getString("Q_TIME") != null ? rs.getString("Q_TIME") : "-";
					
					String qna_t
					= rs.getString("Q_TITLE") != null ? rs.getString("Q_TITLE") : "-";
					
					String qna
					= rs.getString("Q_NUM") != null ? rs.getString("Q_NUM") : "-";
					
					String qna1
						= rs.getString("Q_NUM") != null ? "button" : "hidden";
					
					String qnaa =rs.getString("Q_STATUS");
					String qnaa2 = "";

			        if (qnaa != null) {
			            if (qnaa.equals("O")) {
			            	qnaa2 = "OPEN";
			            } else if (qnaa.equals("P")) {
			            	qnaa2 = "PENDING";
			            } else if (qnaa.equals("C")) {
			            	qnaa2 = "CLOSE";
			            }
			        }
      
		%>
			<tr>
				<td><input type="radio" name="user" value="<%=uId%>"></td>
				<td><%=qna%></td>
				<td><%=uId%></td>
				<td><%=qna_d%></td>
				<td><%=qna_t%></td>
				<td><%=qnaa2%></td>
				<td><input style="margin-bottom: 7px;" type=<%= qna1 %>  onclick="qna('<%=uId %>')" value="확인"></td>
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
	<input type="button" onclick="isback()" value="돌아가기"/>
</form>
</body>
</html>
<script>
	function isback() {
		location.href = "a_home.jsp"
	}
	var form = document.list;
		
		function getReturn(){
					location.reload(); //새로고침
				}		
				
		function qna(uId){
			window.open("a_QnA_Search.jsp?uId="+uId,"qpop","width=1000, height=500");	
		}		

		function searchUser() {
			  var form = document.searchForm;
			  var searchId = form.searchId.value.trim();

			  if (searchId === "") {
			    alert("검색할 문의 번호를 입력해주세요.");
			    return;
			  }

			  // 검색한 아이디로 페이지 이동
			  window.location.href = "a_admin2_Search.jsp?uId=" + searchId;
			}
		
</script>