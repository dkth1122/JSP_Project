<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>업데이트 삭제용</title>
</head>
<body>
//입력한 학번이 있으면서 학과와 학년까지 동일하면, 삭제
//입력한 학번만 동일하면, 학과와 학년을 입력한 값으로 업데이트

	<form name="login" action="jdbc_update.jsp" method="post">
		<div>학번 : <input type="text" name="stuNo"> </div>
		<div>학과 : <input type="text" name="stuDept"> </div>
		<div>학년 : <input type="text" name="stuGrade"> </div>
		<div> <input type="submit" value="회원가입"> </div>
	</form>
</body>
</html>