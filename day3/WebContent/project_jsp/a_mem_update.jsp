<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	*{
		font-family: a타이틀고딕2;
	}
	
	@font-face {
        font-family: "삼립호빵";
        src: url("./img/SDSamliphopangcheTTFOutline.ttf") format("truetype");
    }
    
    @font-face {
        font-family: "a타이틀고딕2";
        src: url("./img/A타이틀고딕2.TTF") format("truetype");
    }
</style>
</head>
<body>
	<%@ include file="jdbc_set.jsp"%>
	<form action="a_mem_update2.jsp">
	<%
		request.setCharacterEncoding("UTF-8");

		
		ResultSet rs = null; // 검색 결과를 담기 위한 객체
		Statement stmt = null; // 쿼리 호출을 위한 객체
		String uId = request.getParameter("uId");
		
		// 멤버십 상태 옵션 배열 정의
		String[] statusOptions = { "ACTIVE", "CANCELED", "SUSPENDED", "EXPIRED" };
		
		try{
			stmt = conn.createStatement();
			String sql = "SELECT * FROM YNY_TB_MEMBERSHIP WHERE U_ID = '" + uId + "'";
			rs = stmt.executeQuery(sql);
			if(rs.next()){
	        	String memNum = rs.getString("MEM_NUM");
	        	String rd = rs.getString("REG_DATE");
	        	String ed = rs.getString("EXP_DATE");
	        	String st = rs.getString("STATUS");
	%>
				<input name="memNum" value="<%=memNum%>" hidden>
                <div><label>등록일 : <input name="rd" value = '<%= rd %>'></label></div>
                <div><label>만료일 : <input name="ed" value = '<%= ed %>'></label></div>
                <div><label>상태 : 
                <select name="st">
                	<% for (String option : statusOptions) { %>
                    <option value="<%= option %>" <%= st.equals(option) ? "selected" : "" %>><%= option %></option>
                	<% } %>
            </select></label></div>
	<%
			} else {
				out.println("없는 사용자");
			}
		}catch(SQLException e){
			out.println(e.getMessage());
		}

	%>
	<div><input type="submit" value="변경" ></div>	
	</form>
	<input type="button" onclick="isback()" value="돌아가기"/>
</body>
</html>
<script>
	function isback() {
        window.opener.getReturn();
        window.close();
	}
</script>
