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

<form name="searchForm" method="get" action="">
  <label style="color: rgb(255, 99, 146); " for="searchId">검색할 아이디:</label>
  <input type="text" id="searchId" name="searchId">
  <input class="btn_input" type="button" onclick="searchUser()" value="검색">
</form>

<form name="list" action="a_user_update.jsp">
	<table>
		<tr>
			<th>선택</th>
			<th>아이디</th>
			<th>이름</th>
			<th>핸드폰번호</th>
			<th>생년월일</th>
			<th>이메일</th>
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
				String sql = "SELECT * FROM YNY_TB_USER WHERE STATUS = 'U'";
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				
				while (rs.next()) {
					String uId = rs.getString("U_ID");
					String uName = rs.getString("U_NAME");
					String phone 
						= rs.getString("PHONE") != null ? rs.getString("PHONE") : "-";
					String birth 
						= rs.getString("BIRTH")  != null ? rs.getString("BIRTH") : "-";
					String email
					= rs.getString("EMAIL")  != null ? rs.getString("EMAIL") : "-";
					String addr
						= rs.getString("ADDR")  != null ? rs.getString("ADDR") : "-";
					
					String banYn = "";
					String banYn1 = rs.getString("BANYN");
					if (banYn1.equals("Y")) {
					    banYn = "정지";
					} else if (banYn1.equals("S")) {
					    banYn = "탈퇴";
					}
					
					String banS = "";
					if (banYn1.equals("Y")) {
					   banS = "red";
					} else if (banYn1.equals("S")) {
						banS = "blue";
					}
					
					String ban = "";
					String originalBanYn = rs.getString("BANYN");

					if (originalBanYn.equals("Y")) {
					    ban = "해제";
					} else if (originalBanYn.equals("N")) {
					    ban = "정지";
					} else if (originalBanYn.equals("S")) {
					    ban = "탈퇴해제";
					}
					
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
				<td><%=birth%></td>
				<td><%=email%></td>
				<td><%=addr%></td>
				<td style="color:<%= banS%>"><%=banYn%></td>
				<td><input style="margin-bottom: 7px; background-color: #fdfdd3;"  type="button" onclick="bchange('<%=rs.getString("BANYN")%>', '<%=uId %>')" value=<%= ban %>></td>
				<td><%=cnt%></td>
				<td><input style="margin-bottom: 7px; background-color: #fdfdd3;"  type=<%= cnt2 %> onclick="cnt('<%=uId %>')" value="초기화"></td>
			</tr>
			
		<%
			}
			} catch (SQLException ex){
				out.println("Member 테이블 호출이 실패했습니다.<br>");
				out.println("SQLException: " + ex.getMessage());
			} 
		%>
	</table>
	<input class="btn_input" type="button" onclick="userUpdate()" value="수정"/>
	<input class="btn_input"  type="button" onclick="userRemove()" value="삭제"/>
	<input class="btn_input"  type="button" onclick="isback()" value="돌아가기"/>
</form>
</body>
</html>
<script>
	function isback() {
		location.href = "a_home.jsp"
	}
	var form = document.list;
		function userRemove(){
			if(!confirm("정말 삭제하시겠습니까?")){
				return;
			}
			   var form = document.list;
			   window.open("a_user_remove.jsp?uId=" + form.user.value,"rpop","width=500, height=300")
		}//userRemove
		
		function bchange(kind,uId){
					if(kind == "N"){
						kind ="Y";
					}else {
						kind = "N"
					}
					window.open("a_user_ban.jsp?uId="+uId+"&kind="+kind,"bpop","width=500, height=300");	
				}
				
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
			   var left = (screen.width - 325) / 2;
			   var top = (screen.height - 280) / 2;
			   
			   var form = document.list;
			   window.open("a_user_update.jsp?uId=" + form.user.value,"upop","width=370, height=400, top=" + top + ", left=" + left);
			}
		
		function searchUser() {
			  var form = document.searchForm;
			  var searchId = form.searchId.value.trim();

			  if (searchId === "") {
			    alert("검색할 아이디를 입력해주세요.");
			    return;
			  }

			  // 검색한 아이디로 페이지 이동
			  window.location.href = "a_user_search.jsp?uId=" + searchId;
			}
		
</script>