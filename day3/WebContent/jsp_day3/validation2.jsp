<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
    <form name="login" action="success.jsp">
        <div> ���̵� : <input type="text" name="id"></div>
        <div> ��й�ȣ : <input type="password" name="pwd"></div>
        <input type="button" value="����" onclick="check();">
    </form>
</body>
</html>
<script>
	// ���̵�� ���� ��ҹ��ڸ� �Է� �����ϵ��� ����
	// ����, Ư������, �ѱ� ���� �Էµ� ���·� ���� �� '���� ��ҹ��ڸ� ����' �˸�
	// �н������ ���ڸ� �����ϵ���, �׷��� ���� �� '�н������ ���ڸ� ����' �˸�

	function check() {
		var login = document.login;

		var a = /^[a-zA-Z]*$/;
		var b = /^[0-9]*$/;
		
		if (!a.test(login.id.value)) {
			alert('���̵�� ���� ��ҹ��ڸ� �Է� �����մϴ�.');
			login.id.focus();
			return;
		}
		
		if (!b.test(login.pwd.value)) {
			alert('�н������ ���ڸ� �Է� �����մϴ�.');
			login.pwd.focus();
			return;
		}
		
		login.submit();
	}
</script>
