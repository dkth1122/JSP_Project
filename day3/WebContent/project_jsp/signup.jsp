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
  
  body {
    background-color: aliceblue;
  }
  
  #container {
    width: 650px;
    margin: 10px auto;
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
    border: 1px solid rgb(253, 167, 167);
  }
  
  .email_input{
    height:30px;
    border: 1px solid rgb(253, 167, 167);
  }
  
  .phone_input{
    width:100px;
    height:30px ;
    border: 1px solid rgb(253, 167, 167);
  }
  
  .error-msg {
    color: red;
  }
  
</style>
</head>
<body>
  <div id="container">
    <h1>💕회원 가입을 환영합니다</h1>
    <form name="list" action="signup_insert.jsp">
      <fieldset>
        <legend>사용자 정보</legend>
        <ul>
          <li>
            <label class="li_label" for="uid">아이디</label>
            <input class="txt_input" type="text" name="uid" required>
            <div id="uid-error" class="error-msg"></div>
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
            <label class="li_label"  for="age2">생년월일</label>
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
            <label class="li_label" for="email">이메일주소</label>
            <input class="email_input" type="text" name="email" />
            <label>@</label>
            <input class="email_input" id="domain-txt" type="text" name="e-domain2"/>
            <select class="email_input" id="domain-list" name="e-domain">
              <option value="type">직접 입력</option>
              <option value="naver.com">naver.com</option>
              <option value="google.com">google.com</option>
              <option value="hanmail.net">hanmail.net</option>
              <option value="nate.com">nate.com</option>
              <option value="kakao.com">kakao.com</option>
            </select>
            <div id="email-error" class="error-msg"></div>
          </li>
          
          <li>
            <label class="li_label" for="phone1">핸드폰 번호</label>
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
            <div id="phone-error" class="error-msg"></div>
          </li>
          
          <li>
            <label class="li_label" for="addr">주소</label>
            <input class="txt_input" type="text" name="addr" >
            <div id="addr-error" class="error-msg"></div>
          </li>

        </ul>
      </fieldset>
      <fieldset>
        <legend>이벤트와 새로운 소식</legend>
        <input type="radio" name="mailing" id="mailing_y"> 
        <label for="mailing_y">메일 수신</label> 
        <input type="radio" name="mailing" id="mailing_n" checked> 
        <label for="mailing_n">메일 수신 안 함</label>
      </fieldset>
      <div id="buttons">
        <input class="btn_input" type="button" onclick="signup()" value="가입하기"/> 
        <input class="btn_input" type="button" onclick="isback()" value="홈페이지로"/>
      </div>
    </form>
  </div>
</body>
</html>
<script>
function submitForm() {
  if (validateForm()) {
    document.forms['list'].submit();
  }
}

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
  let id = form.uid.value;
  let pw = form.pwd.value;
  let pw2 = form.pwd2.value;
  let uname = form.uname.value;

  let str1 = /^[a-zA-Z0-9]*$/;

  if (!str1.test(id)) {
    showErrorMsg('uid-error', '아이디는 영어와 숫자만 입력 가능, 한글 금지');
    form.uid.select();
    return;
  }

  if (id == undefined || id == "") {
    showErrorMsg('uid-error', '아이디를 입력해주세요');
    return;
  }

  if (pw != pw2) {
    showErrorMsg('pwd2-error', '비밀번호가 일치하지 않습니다.');
    return;
  }
  
  if (pw == undefined || pw == "") {
    showErrorMsg('pwd-error', '비밀번호를 입력해주세요');
    return;
  }
  
  if (uname == undefined || uname == "") {
    showErrorMsg('uname-error', '이름을 입력해주세요');
    return;
  }

  form.submit();
}

// 홈페이지로 버튼을 눌렀을 때 실행되는 함수
function isback(){		
  location.href = "home_main.jsp";		
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
function resetUidErrorMsg() {
  resetErrorMsg('uid-error');
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


// 아이디 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function handleUidInputChange() {
  resetUidErrorMsg();
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

//이름 입력 필드의 값이 변경될 때마다 에러 메시지를 초기화합니다
function handleBirthInputChange() {
  resetBirthErrorMsg();
}

// 아이디 입력 필드에 이벤트 리스너를 등록합니다
const uidInputEl = document.querySelector('input[name="uid"]');
uidInputEl.addEventListener('input', handleUidInputChange);

// 비밀번호 입력 필드에 이벤트 리스너를 등록합니다
const pwdInputEl = document.querySelector('input[name="pwd"]');
pwdInputEl.addEventListener('input', handlePwdInputChange);

//비밀번호 확인 입력 필드에 이벤트 리스너를 등록합니다
const pwd2InputEl = document.querySelector('input[name="pwd2"]');
pwd2InputEl.addEventListener('input', handlePwd2InputChange);

// 이름 입력 필드에 이벤트 리스너를 등록합니다
const unameInputEl = document.querySelector('input[name="uname"]');
unameInputEl.addEventListener('input', handleUnameInputChange);

</script>