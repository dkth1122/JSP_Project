<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>������Ʈ ������</title>
</head>
<body>
//�Է��� �й��� �����鼭 �а��� �г���� �����ϸ�, ����
//�Է��� �й��� �����ϸ�, �а��� �г��� �Է��� ������ ������Ʈ

	<form name="login" action="jdbc_update.jsp" method="post">
		<div>�й� : <input type="text" name="stuNo"> </div>
		<div>�а� : <input type="text" name="stuDept"> </div>
		<div>�г� : <input type="text" name="stuGrade"> </div>
		<div> <input type="submit" value="ȸ������"> </div>
	</form>
</body>
</html>