<img src="https://capsule-render.vercel.app/api?type=waving&color=ffd400&height=200&section=header&text=&fontSize=50&fontColor=fff" />
<br>
<br>

![다운로드](https://github.com/dkth1122/project_jsp/assets/134511884/2f9f6728-18e3-4fc9-adfe-26da7647547a)

<h2>🔎 프로젝트 정보</h2>
<div><b>📆 2023.07.11 ~ 2023.07.17 (7일)</b></div>
<div>더조은컴퓨터아카데미 첫 번째 개인 프로젝트.</div>

[PDF 다운로드](JSP_Project_윤나연.pdf)

<br>
<br>
<h2>✨ 프로젝트 소개</h2>
<div>
2023년 7월 11일부터 7월 17일까지 진행한 미니프로젝트는 JSP를 활용한 고객관리시스템 개발을 주제로 진행되었습니다. </div>
<div>
  이 프로젝트에서는 반려동물용품 쇼핑몰 참고하여 고객 정보를 관리하고 조회하는 시스템을 개발했습니다.
</div>
<br>
<br>
<br>
<h2>🛠 Stacks</h2>
<div>
  <img src="https://img.shields.io/badge/java-007396?style=for-the-badge&logo=java&logoColor=white"> 
  <img src="https://img.shields.io/badge/jsp-FF8C42?style=for-the-badge&logo=jsp&logoColor=white"> 
  <img src="https://img.shields.io/badge/javascript-F7DF1E?style=for-the-badge&logo=javascript&logoColor=black"> 
  <img src="https://img.shields.io/badge/jquery-0769AD?style=for-the-badge&logo=jquery&logoColor=white">
  <img src="https://img.shields.io/badge/html5-E34F26?style=for-the-badge&logo=html5&logoColor=white"> 
  <img src="https://img.shields.io/badge/css-1572B6?style=for-the-badge&logo=css3&logoColor=white"> 
  <img src="https://img.shields.io/badge/oracle-F80000?style=for-the-badge&logo=oracle&logoColor=white"> 
  <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> 
  <img src="https://img.shields.io/badge/fontawesome-339AF0?style=for-the-badge&logo=fontawesome&logoColor=white">
  <img src="https://img.shields.io/badge/Eclipse%20IDE-2C2255.svg?&style=for-the-badge&logo=Eclipse%20IDE&logoColor=white">
</div>
</div>
<br>
<br>
## DB 설계

| 컬럼명    | 데이터타입       | PK | NULL | 설명            | 조건                        | 비고                   |
|----------|------------------|----|------|-----------------|-----------------------------|------------------------|
| U_ID     | varchar(12)      | O  | X    | 아이디          | 6~12자 영문+숫자            |                        |
| PWD      | varchar(20)      |    | X    | 비밀번호        | 영문+숫자+특수문자          |                        |
| U_NAME   | varchar(10 char) |    | X    | 이름            | 1~10자                     |                        |
| AGE      | number           |    | X    | 생년월일         | 1923년 생부터 2023년 생까지 |                        |
| PHONE    | varchar(20)      |    | O    | 휴대폰 번호      | 11자 까지                  |                        |
| ADDR     | varchar(40)      |    | O    | 주소            |                            |                        |
| STATUS   | char(1)           |    | O    | 권한            | 일반 U, 관리자 A            |                        |
| CNT      | number           |    | X    | 로그인 시도 횟수 | 디폴트 0                   | 1년 정산에 사용         |
| BANYN    | char(1)           |    | X    | 계정 정지 여부  | Y또는 N 디폴트 N          |                        |
| MEMBER   | char(1)           |    | X    | 멤버쉽 가입 여부 | Y또는 N 디폴트 N          |                        |
| SIGNUP_D | datetime          |    | X    | 가입일자         |                            |                        |
| UPDATE   | datetime          |    | O    | 수정일자         |                            | 이거 깃 리드미에 표로 넣게 바꿔줘 |

<br>
<br>
<h2>⚙ 기능 구현</h2>
<ul>
  <li>파일 확인</li>
  https://github.com/dkth1122/JSP_Project/tree/4ebd3c3659f767c24ccba79c3ac0d30c87677d90/day3/WebContent/project_jsp
  <br><br>
  <li>로그인 기능</li>
  <br>
  <li>회원 가입 기능</li>
  <br>
  <li>마이페이지 - 정보 수정, 멤버쉽 구독 및 관리, 1:1 문의, 회원 탈퇴 </li>
  <br>
  <li>회원 관리 - 정보 수정, 로그인 시도 횟수 초기화, 계정 정지, 검색 기능 등</li>
  <br>
  <li>회원 멤버쉽 관리</li>
  <br>
  <li>1:1 문의 관리</li>
  <br>
</ul>
<br>
<br>
<img src="https://capsule-render.vercel.app/api?type=waving&color=ffd400&height=200&section=footer&text=&fontSize=50&fontColor=fff" />
