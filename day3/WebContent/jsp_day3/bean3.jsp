<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
	div{
		font-size: 30px;
		color: blue;
	}
</style>
</head>
<body>
	<jsp:useBean id="Human" class="day3.com.dao.Human"></jsp:useBean>
	<jsp:setProperty property="id" name="Human" value="kim"/>
	<jsp:setProperty property="name" name="Human" value="김철수"/>
	
	<div>아이디 : <jsp:getProperty property="id" name="Human"/> </div>
	
	<%
		String id = Human.getId();
		String name = Human.getName();
		int age = Human.getAge();
		int java = Human.getJava();
		int oracle = Human.getOracle();
		out.println("<div>"+"아이디 : "  + id + "</div>");
		out.println("<div>"+"이름 : "  + name + "</div>");
		out.println("<div>"+"나이 : "  + age + "</div>");
		out.println("<div>"+"자바점수 : "  + java + "</div>");
		out.println("<div>"+"오라클점수 : "  + oracle + "</div>");
	%>

</body>
</html>