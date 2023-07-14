<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="gg" class="day3.com.dao.GuGuDan"></jsp:useBean>
	<h4>구구단 출력하기</h4>	
	<%
		for(int i=1; i<9; i++){
			out.println(gg.process(5, i) + "<br>");
		}
	%>
</body>
</html>