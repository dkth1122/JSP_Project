<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<form action="hidden_event.jsp" name="evt">
		<input placeholder="KIND" type="text"  name="btnKind" hidden>
		<input placeholder="stuNo"  type="text"  name="stuNo">
		<input type="button" value="�˻�" onclick="evtKind('search')">
		<input type="button" value="����" onclick="evtKind('insert')">
		<input type="button" value="����" onclick="evtKind('remove')">
	
	
	</form>

</body>
</html>
<script>
	function evtKind(text) {
		document.evt.btnKind.value = text;
		document.evt.submit();
	}
</script>