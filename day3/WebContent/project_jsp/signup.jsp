<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  * {
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
    
  body {
    background-color: #fdfdd3;
    margin: 10px 550px;
  }
  
  #h{
  	font-family: "삼립호빵";
  	font-size: 50px;
  	margin: 30px auto;
  	width: 540px ;
  	color: rgb(255, 99, 146);
  	background: white;
  }
  
  #container {
    width: 590px;
    margin: 50px auto;
  }
  
  .c_h{
    text-align: center;
	font-family: "삼립호빵" ;
	font-size: 32px; 
	color: rgb(255, 99, 146);
	margin: 40px;
  }
  
  
  fieldset {
  	width: 500px;
    height: 600px;
    margin-bottom: 20px;
    background-color: white;
    border: 3px dashed rgb(253, 167, 167);
    border-radius: 50px;
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
  
    .li_label2 {
    width: 120px;
    line-height: 36px;
    float: left;
    font-weight: bold;
    color: #83e6a2;
  }
  
  .txt_input {
    width: 300px;
    height: 30px;
    border: 1px solid #9ADFB0;
  }
  
  #buttons {
    width: 400px;
    margin: 20px auto;
    text-align: center;
  }
  
 	.btn_input {
		width: 150px;
	  	height: 36px;
		font-size: 15px;
		font-family: a타이틀고딕2;
		color:rgb(255, 99, 146);
		border-radius: 30px;
		border:1px solid pink;
		background-color: #fdfdd3;
		margin: 30px 10px;
	}
	
	 	.btn_input2 {
		width: 60px;
	  	height: 30px;
		font-size: 12px;
		font-family: a타이틀고딕2;
		color:rgb(255, 99, 146);
		border-radius: 30px;
		border:1px solid pink;
		background-color: #fdfdd3;
	}

  input[required] {
    border: 1px solid pink;
  }
  
  li label {
    font-style: italic;
    color: rgb(255, 99, 146);
  }
  
  input:checked+label {
    font-weight: bold;
  }
  
  #b_check{
    margin-left:10px;
  }
  
  /* SECTION - BIRTH */
  .info#info__birth {
    display: flex;
  }
  
  .info#info__birth select {
    margin-left : 7px;
  }
  
  .info#info__birth select:first-child {
    margin-left : 0px;
  }
  
  .birth_sel{
    width: 100px;
    height:30px;
    border: 1px solid #9ADFB0;
  }
  
  .email_input{
    height:30px;
    border: 1px solid #9ADFB0;
    
  }
  
  .phone_input{
    width:100px;
    height:30px ;
    border: 1px solid #9ADFB0;
  }
  
  .error-msg {
    color: red;
  }
  
  	input:focus { 
		outline: none !important; border-bottom-color: pink; box-shadow: 0 0 10px #d6a8e9; 
		}
  
</style>
</head>
<body>
    <form name="list" action="signup_insert.jsp">
    <div id="h">💕회원 가입을 환영해요💕</div>
      <fieldset>
      <div id="container">
        <ul>
        <div class="c_h">사용자 정보</div>
          <li>
            <label class="li_label" for="uId">아이디</label>
            <input class="txt_input" type="text" name="uId" required>
            <input class="btn_input2" type="button" onclick="idCheck()" value="중복체크">
            <div id="uId-error" class="error-msg"></div>
          </li>
          
          <li>
            <label class="li_label" for="pwd">비밀번호</label>
            <input class="txt_input" type="password" name="pwd" required>
            <div id="pwd-error" class="error-msg"></div>
          </li>
              
          <li>
            <label class="li_label" for="pwd2">비밀번호 확인</label>
            <input class="txt_input" type="password" name="pwd2" required>
            <div id="pwd2-error" class="error-msg"></div>
          </li>
              
          
          <li>
            <label class="li_label" for="uname">이름</label>
            <input class="txt_input" type="text" name="uname" required>
            <div id="uname-error" class="error-msg"></div>
          </li>
          
          <li>
            <label class="li_label2"  for="age2">생년월일</label>
            <div class="info" id="info__birth">
              <select id="birth-year" name="age-year" class="birth_sel">
                <option disabled selected>출생 연도</option>
              </select>
              <select id="birth-month" name="age-month" class="birth_sel">
                <option disabled selected>월</option>
              </select>
              <select  id="birth-day" name="age-day" class="birth_sel">
                <option disabled selected>일</option>
              </select>
            </div>
            <div id="birth-error" class="error-msg"></div>
          </li>               
                      
          <li>
            <label class="li_label2" for="email">이메일주소</label>
            <input class="email_input" type="text" name="email" />
            <label>@</label>
            <input class="email_input" id="domain-txt" type="text" name="e-domain2"/>
            <select class="email_input" id="domain-list" name="e-domain">
              <option value="">직접 입력</option>
              <option value="naver.com">naver.com</option>
              <option value="google.com">google.com</option>
              <option value="hanmail.net">hanmail.net</option>
              <option value="nate.com">nate.com</option>
              <option value="kakao.com">kakao.com</option>
            </select>
            <div id="email-error" class="error-msg"></div>
          </li>
          
          <li>
            <label class="li_label2" for="phone1">핸드폰 번호</label>
            <select class="phone_input" name="phone1">
              <option value="">번호 선택</option>
              <option value="010">010</option>
              <option value="011">011</option>
              <option value="016">016</option>
              <option value="017">017</option>
              <option value="018">018</option>
              <option value="019">019</option>
            </select>
            <label>-</label>
            <input class="phone_input" type="text" name="phone2" />
            <label>-</label>
            <input class="phone_input" type="text" name="phone3" /> 
            <div id="phone2-error" class="error-msg"></div>
            <div id="phone3-error" class="error-msg"></div>
          </li>
          
          <li>
            <label class="li_label2" for="addr">주소</label>
            <input class="txt_input" type="text" name="addr" >
            <div id="addr-error" class="error-msg"></div>
          </li>
      <div id="buttons">
        <input class="btn_input" type="button" onclick="signup()" value="가입하기"/> 
        <input class="btn_input" type="button" onclick="isback()" value="홈페이지로"/>
      </div>
        </ul>
      </fieldset>
    </form>
  </div>
</body>
</html>
<script>
var check1 = false; // 아이디 중복체크 확인 여부 

var check2 = false; // 중복 여부 

function isback() {   
  location.href = "home_main.jsp";   
}

//'출생 연도' 셀렉트 박스 option 목록 동적 생성
const birthYearEl = document.querySelector('#birth-year');
// option 목록 생성 여부 확인
isYearOptionExisted = false;
birthYearEl.addEventListener('focus', function () {
  // year 목록 생성되지 않았을 때 (최초 클릭 시)
  if (!isYearOptionExisted) {
    isYearOptionExisted = true;
    for (var i = 1940; i <= 2022; i++) {
      // option element 생성
      const YearOption = document.createElement('option');
      YearOption.setAttribute('value', i);
      YearOption.innerText = i;
      // birthYearEl의 자식 요소로 추가
      this.appendChild(YearOption);
    }
  }
});

// Month도 동일한 방식으로 구현
const birthMonthEl = document.querySelector('#birth-month');
// option 목록 생성 여부 확인
isMonthOptionExisted = false;
birthMonthEl.addEventListener('focus', function () {
  // Month 목록 생성되지 않았을 때 (최초 클릭 시)
  if (!isMonthOptionExisted) {
    isMonthOptionExisted = true;
    for (var i = 1; i <= 12; i++) {
      // option element 생성
      const MonthOption = document.createElement('option');
      MonthOption.setAttribute('value', i);
      MonthOption.innerText = i;
      // birthMonthEl의 자식 요소로 추가
      this.appendChild(MonthOption);
    }
  }
});

// Day도 동일한 방식으로 구현
const birthDayEl = document.querySelector('#birth-day');
// option 목록 생성 여부 확인
isDayOptionExisted = false;
birthDayEl.addEventListener('focus', function () {
  // Day 목록 생성되지 않았을 때 (최초 클릭 시)
  if (!isDayOptionExisted) {
    isDayOptionExisted = true;
    for (var i = 1; i <= 31; i++) {
      // option element 생성
      const DayOption = document.createElement('option');
      DayOption.setAttribute('value', i);
      DayOption.innerText = i;
      // birthDayEl의 자식 요소로 추가
      this.appendChild(DayOption);
    }
  }
});

// 도메인 직접 입력 or domain option 선택
const domainListEl = document.querySelector('#domain-list');
const domainInputEl = document.querySelector('#domain-txt');
// select 옵션 변경 시
domainListEl.addEventListener('change', (event) => {
  // option에 있는 도메인 선택 시
  if (event.target.value !== 'type') {
    // 선택한 도메인을 input에 입력하고 disabled
    domainInputEl.value = event.target.value;
    domainInputEl.disabled = true;
  } else {
    // 직접 입력 시
    // input 내용 초기화 & 입력 가능하도록 변경
    domainInputEl.value = '';
    domainInputEl.disabled = false;
  }
});

//가입 버튼을 눌렀을 때 실행되는 함수
function signup() {
  let form = document.list;
  let id = form.uId.value;
  let pw = form.pwd.value;
  let pw2 = form.pwd2.value;
  let uname = form.uname.value;
  let phone2 = form.phone2.value; // 전화번호 두 번째 부분
  let phone3 = form.phone3.value; // 전화번호 세 번째 부분

  let str1 = /^[A-Za-z0-9+]{6,12}$/;
  
  if(!check1){ 
	  alert("아이디 중복체크를 해주세요."); 
	  return; 
	  } 

	  if(!check2){ 
	  alert("중복된 아이디가 있습니다."); 
	  return; 
	  } 

	  if (!str1.test(id)) {
		    showErrorMsg('uId-error', '아이디는 영어와 숫자만 입력 가능, 6~12자');
		    document.list.uId.focus();
		    return;
		  }

		if (id === "") {
		    showErrorMsg('uId-error', '아이디를 입력해주세요');
		    return;
		  }

		  if (pw !== pw2) {
		    showErrorMsg('pwd2-error', '비밀번호가 일치하지 않습니다.');
		    return;
		  }

		  if (pw === "") {
		    showErrorMsg('pwd-error', '비밀번호를 입력해주세요');
		    return;
		  }

		  if (pw.length > 20) {
		    showErrorMsg('pwd-error', '비밀번호는 20자 이하여야 합니다.');
		    return;
		  }

		  if (uname === "") {
		    showErrorMsg('uname-error', '이름을 입력해주세요');
		    return;
		  }

		  if (uname.length > 10) {
		    showErrorMsg('uname-error', '이름은 10자 이하여야 합니다.');
		    return;
		  }

		  if (phone2.length > 5) {
		    showErrorMsg('phone2-error', '전화번호는 5자 이하여야 합니다.');
		    return;
		  }
		  
		  if (phone3.length > 5) {
		    showErrorMsg('phone3-error', '전화번호는 5자 이하여야 합니다.');
		    return;
		  }

  form.submit();
}

function idCheck(){ 
	check1 = true; 
	var form = document.list; 
		if(form.uId.value =="" || form.uId.value.length < 0){ 
		alert("아이디를 먼저 입력해주세요") 
		form.uId.focus(); 
		}else{ 
		window.open("u_idcheck.jsp?uId="+form.uId.value, "check","width=500, height=300"); 
		} 
	} 

function getReturn(val){ 
	if(val == "Y"){ 
	check2 = true; 
	} else { 
	check2 = false; 
	} 
} 

// 에러 메시지 출력 함수
function showErrorMsg(elementId, errorMsg) {
  const errorEl = document.getElementById(elementId);
  errorEl.innerHTML = errorMsg;
  errorEl.style.display = 'block'; // 에러 메시지 보이도록 설정
}

// 입력 필드 값이 변경될 때마다 에러 메시지를 초기화합니다
function resetErrorMsg(elementId) {
  const errorEl = document.getElementById(elementId);
  errorEl.innerHTML = "";
  errorEl.style.display = 'none'; // 에러 메시지 숨김 설정
}

// 아이디 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function resetuIdErrorMsg() {
  resetErrorMsg('uId-error');
}

// 비밀번호 확인 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function resetPwd2ErrorMsg() {
  resetErrorMsg('pwd2-error');
}

// 비밀번호 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function resetPwdErrorMsg() {
  resetErrorMsg('pwd-error');
}

// 이름 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function resetUnameErrorMsg() {
  resetErrorMsg('uname-error');
}

//전화번호2 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function resetPhone2ErrorMsg() {
  resetErrorMsg('phone2-error');
}

//전화번호3 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function resetPhone3ErrorMsg() {
  resetErrorMsg('phone3-error');
}

// 아이디 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function handleuIdInputChange() {
  resetuIdErrorMsg();
}

//비밀번호 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function handlePwdInputChange() {
  resetPwdErrorMsg();
}

// 비밀번호 확인 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function handlePwd2InputChange() {
  resetPwd2ErrorMsg();
}

// 이름 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function handleUnameInputChange() {
  resetUnameErrorMsg();
}

//전화번호 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function handlePhone2InputChange() {
	resetPhone2ErrorMsg();
}
//전화번호 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function handlePhone3InputChange() {
	resetPhone3ErrorMsg();
}

// 아이디 입력 필드에 이벤트 리스너를 등록합니다
const uIdInputEl = document.querySelector('input[name="uId"]');
uIdInputEl.addEventListener('input', handleuIdInputChange);

// 비밀번호 입력 필드에 이벤트 리스너를 등록합니다
const pwdInputEl = document.querySelector('input[name="pwd"]');
pwdInputEl.addEventListener('input', handlePwdInputChange);

//비밀번호 확인 입력 필드에 이벤트 리스너를 등록합니다
const pwd2InputEl = document.querySelector('input[name="pwd2"]');
pwd2InputEl.addEventListener('input', handlePwd2InputChange);

// 이름 입력 필드에 이벤트 리스너를 등록합니다
const unameInputEl = document.querySelector('input[name="uname"]');
unameInputEl.addEventListener('input', handleUnameInputChange);

//전화번호2 입력 필드에 이벤트 리스너를 등록합니다
const phone2InputEl = document.querySelector('input[name="phone2"]');
phone2InputEl.addEventListener('input', resetPhone2ErrorMsg);

//전화번호3 입력 필드에 이벤트 리스너를 등록합니다
const phone3InputEl = document.querySelector('input[name="phone3"]');
phone3InputEl.addEventListener('input', resetPhone3ErrorMsg);

</script>