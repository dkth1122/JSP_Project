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
	<jsp:setProperty property="name" name="Human" value="��ö��"/>
	
	<div>���̵� : <jsp:getProperty property="id" name="Human"/> </div>
	
	<%
		String id = Human.getId();
		String name = Human.getName();
		int age = Human.getAge();
		int java = Human.getJava();
		int oracle = Human.getOracle();
		out.println("<div>"+"���̵� : "  + id + "</div>");
		out.println("<div>"+"�̸� : "  + name + "</div>");
		out.println("<div>"+"���� : "  + age + "</div>");
		out.println("<div>"+"�ڹ����� : "  + java + "</div>");
		out.println("<div>"+"����Ŭ���� : "  + oracle + "</div>");
	%>

</body>
</html>