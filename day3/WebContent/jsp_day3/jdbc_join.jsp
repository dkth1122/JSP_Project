<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert ���̺�</title>
</head>
<body>
	<form name="login" action="jdbc_insert1.jsp" method="post">
		<div>�й� : <input type="text" name="stuNo"> </div>
		<div>�̸� : <input type="text" name="stuName"> </div>
		<div>�а� : <input type="text" name="stuDept"> </div>
		<div>�г� : <input type="text" name="stuGrade"> </div>
		<div> <input type="button" value="ȸ������" onclick="check()"> </div>
	</form>
</body>
</html>
<script>
function check() {
	var login = document.login;
	
	if (login.stuNo.value.length != 8) {
		alert('8���ڷ� �Է��Ͻÿ�.');
		login.stuNo.select();
		return;
	}
	login.submit();
}
</script>