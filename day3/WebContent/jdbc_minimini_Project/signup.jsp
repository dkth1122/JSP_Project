<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
		background-color: aliceblue;
	}
	
	#container {
		width: 600px;
		margin: 10px auto;
		font-family: a타이틀고딕2;
	}
	
	fieldset {
		margin-bottom: 20px;
		background-color: white;
		border: 3px dashed rgb(253, 167, 167);
	}
	
	ul {
		list-style: none;
		padding-left: 0;
	}
	
	li {
		margin: 10px;
	}
	
	.li_label {
		width: 120px;
		line-height: 36px;
		float: left;
		font-weight: bold;
	}
	
	.txt_input {
		width: 300px;
		height: 30px;
		font-family: a타이틀고딕2;
		border: 1px solid rgb(253, 167, 167);
	}
	
	#buttons {
		width: 400px;
		margin: 20px auto;
		text-align: center;
	}
	
	.btn_input {
		width: 150px;
		height: 50px;
		font-size: 20px;
		font-family: a타이틀고딕2;
	}

	input[required] {
		border: 1px solid rgb(76, 0, 255);
	}
	
	li label {
		font-style: italic;
		color: rgb(79, 62, 173);
	}
	
	input:checked+label {
		font-weight: bold;
	}
	
	#b_check{
		margin-left:10px;
		font-family: a타이틀고딕2;
	}
</style>
</head>
<body>
	<div id="container">
		<h1>💕회원 가입을 환영합니다</h1>
		<form name="list" action="insert.jsp">
			<fieldset>
				<legend>사용자 정보</legend>
				<ul>
					<li><label class="li_label" for="uid">아이디</label> 
					<input class="txt_input" type="text" name="uid" required></li>
					
					<li><label class="li_label" for="pwd1">비밀번호</label> 
					<input class="txt_input" type="password" name="pwd1" required></li>
						
					<li><label class="li_label" for="pw2">비밀번호 확인</label> 
					<input class="txt_input" type="password" name="pwd2" required></li>
						
					<li><label class="li_label" for="uname">이름</label> 
					<input class="txt_input" type="text" name="uname" required></li>
					
					<li><label class="li_label" for="phone">핸드폰 번호</label> 
					<input class="txt_input" type="text" name="phone" ></li>
						
					<li><label class="li_label" for="age">나이</label> 
					<input class="txt_input" type="number" name="age" ></li>
						
					<li><label class="li_label" for="addr">주소</label> 
					<input class="txt_input" type="text" name="addr" ></li>

				</ul>
			</fieldset>
			<div id="buttons">
				<input class="btn_input" type="button" onclick="login()" value="가입하기"/> 
				<input class="btn_input" type="reset" value="취소"/>
			</div>
		</form>
	</div>
</body>
</html>
<script>
  function login(){
	  let form = document.list;
	  let id = form.uid.value;
	  let pw = form.pwd1.value;
	  let pw2 = form.pwd2.value;
	  let uname = form.uname.value;	 
	  
	  let str1 =  /^[a-zA-Z0-9]*$/;
	  
	  if(!str1.test(id)){
	    	alert("아이디는 영어와 숫자만 입력 가능, 한글 금지")
	    	 form.uid.select();
	    	return;
	}
	 
	  if (id == undefined || id == ''){
      alert("아이디를 입력해주세요");
      return;
    }

    if (pw != pw2) {
      alert("비밀번호가 일치하지 않습니다.");
      return;
    }
    
    if (pw == undefined || pw == ''){
        alert("비밀번호를 입력해주세요");
        return;
      }
    
    if (uname == undefined || uname == ''){
        alert("이름을 입력해주세요");
        return;
      }
    form.submit();
  }
 </script>