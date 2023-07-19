<%@page import="java.rmi.server.UID"%>
<%@page import="javax.websocket.OnClose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>﻿
<style>
	@font-face {
        font-family: "삼립호빵";
        src: url("./img/SDSamliphopangcheTTFOutline.ttf") format("truetype");
    }
    
    @font-face {
        font-family: "a타이틀고딕2";
        src: url("./img/A타이틀고딕2.TTF") format("truetype");
    }
	*{
		font-family: a타이틀고딕2;
	}
	body {
		background-color:#e8ffef;
		text-align: center;
		font-size: 16px;
		color: #ggg;
	}
	th {
		background-color: #fdfdd3;
		color: rgb(255, 99, 146);
	}
	table{
		border-collapse: collapse;
		margin: 10px auto;
	}
	td, th {
		border: 1px solid pink;
		padding: 3px;
	}
	.btn{
		width: 50px;
		margin: 10px auto;
	}
	td{
		background-color: white;
	}
	.btn_input{
		width: 100px;
		height: 24px;
		font-size: 15px;
		font-family: a타이틀고딕2;
		color:rgb(255, 99, 146);
		border-radius: 30px;
		border:1px solid pink;
		background-color: #fdfdd3;
		cursor: pointer;
		}
	input{
		margin: 5px;
		border: 1px solid pink;
		color: rgb(255, 99, 146);
	}
	input:focus { 
		outline: none !important; border-bottom-color: pink; box-shadow: 0 0 10px #d6a8e9; 
	}
</style>
</head>
<body>
	<%@ include file="jdbc_set.jsp"%>

	<form name="searchForm" method="get" action="a_admin2_Search.jsp">
		<label for="searchId" style="color:rgb(255, 99, 146)">검색할 아이디:</label> 
		<input type="text" id="searchId" name="searchId"> 
		<input class="btn_input" type="button" onclick="searchUser()" value="검색">
	</form>

	<form name="list">
		<table>
			<tr>
				<th>문의 번호</th>
				<th>아이디</th>
				<th>문의 날짜</th>
				<th>제목</th>
				<th>문의 상태</th>
				<th>답변</th>
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

					String qna_d = rs.getString("Q_TIME") != null ? rs.getString("Q_TIME") : "-";

					String qna_t = rs.getString("Q_TITLE") != null ? rs.getString("Q_TITLE") : "-";

					String qna = rs.getString("Q_NUM") != null ? rs.getString("Q_NUM") : "-";

					String qnaa = rs.getString("Q_STATUS");
					String qnaa2 = "";

					qnaa2 = (qnaa == null) ? "-" : (qnaa.equals("O") ? "OPEN" : (qnaa.equals("P") ? "PENDING" : "CLOSE"));

					String qstyle = "";
					if (qnaa2.equals("OPEN")) {
						qstyle = "red";
					} else if (qnaa2.equals("PENDING")) {
						qstyle = "blue";
					} else if (qnaa2.equals("CLOSE")) {
						qstyle = "black";
					}

					String aChe = rs.getString("Q_STATUS").equals("C") ? "수정" : "답변";
			%>
			<tr>
				<td><%=qna%></td>
				<td><%=uId%></td>
				<td><%=qna_d%></td>
				<td><%=qna_t%></td>
				<td style="color:<%=qstyle%>"><%=qnaa2%></td>
				<td><input style="background-color: #fdfdd3;" type="button" value="<%=aChe%>"onclick="qq_a('<%=qna%>', '<%=uId%>')"></td>
			</tr>

			<%
			}//while(rs.next());
			} catch (SQLException ex) {
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			}
			%>
		</table>
		<input class="btn_input" type="button" onclick="isback()" value="돌아가기" />
	</form>
</body>
</html>
<script>
	function isback() {
		location.href = "a_home.jsp"
	}

	function getReturn() {
		location.reload(); //새로고침
	}

	function qq_a(qNo, uId) {
		window.open("a_QnA_Answer.jsp?qNo=" + qNo + "&uId=" + uId, "popup1",
				"width=500, height=500");
	}

	function searchUser() {
		var form = document.searchForm;
		var searchId = form.searchId.value.trim();

		if (searchId === "") {
			alert("검색할 문의 번호를 입력해주세요.");
			return;
		}
		form.submit();
	}
</script>