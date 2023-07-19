<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="jdbc_set.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색 결과</title>
<style>
	@font-face {
        font-family: "삼립호빵";
        src: url("./img/SDSamliphopangcheTTFOutline.ttf") format("truetype");
    }
    
    @font-face {
        font-family: "a타이틀고딕2";
        src: url("./img/A타이틀고딕2.TTF") format("truetype");
    }
	*{
		font-family: a타이틀고딕2;
	}
	body {
		background-color:#e8ffef;
		text-align: center;
		font-size: 16px;
		color: #ggg;
	}
	th {
		background-color: #fdfdd3;
		color: rgb(255, 99, 146);
	}
	table{
		border-collapse: collapse;
		margin: 10px auto;
	}
	td, th {
		border: 1px solid pink;
		padding: 3px;
	}
	.btn{
		width: 50px;
		margin: 10px auto;
	}
	td{
		background-color: white;
	}
	.btn_input{
		width: 100px;
		height: 24px;
		font-size: 15px;
		font-family: a타이틀고딕2;
		color:rgb(255, 99, 146);
		border-radius: 30px;
		border:1px solid pink;
		background-color: #fdfdd3;
		cursor: pointer;
		}
	input{
		margin: 5px;
		border: 1px solid pink;
		color: rgb(255, 99, 146);
	}
	input:focus { 
		outline: none !important; border-bottom-color: pink; box-shadow: 0 0 10px #d6a8e9; 
	}
	h1{
		color: rgb(255, 99, 146);
	}
</style>
</head>
<body>
  <%-- 아이디로 회원 검색 --%>
  <%!
  // 회원 정보를 담을 클래스
  class UserInfo {
    private String uId;
    private String uName;
    private String phone;
    private String birth;
    private String email;
    private String addr;
    private String banYn;
    private int cnt;
    // 다른 필드들도 추가

    // 생성자
    public UserInfo() {
    }

    // Getter와 Setter 메서드들
    public String getUId() {
      return uId;
    }

    public void setUId(String uId) {
      this.uId = uId;
    }

    public String getUName() {
      return uName;
    }

    public void setUName(String uName) {
      this.uName = uName;
    }

    public String getPhone() {
      return phone;
    }

    public void setPhone(String phone) {
      this.phone = phone;
    }

    public String getBirth() {
      return birth;
    }

    public void setBirth(String birth) {
      this.birth = birth;
    }

    public String getEmail() {
      return email;
    }

    public void setEmail(String email) {
      this.email = email;
    }

    public String getAddr() {
      return addr;
    }

    public void setAddr(String addr) {
      this.addr = addr;
    }

    public String getBanYn() {
      return banYn;
    }

    public void setBanYn(String banYn) {
      this.banYn = banYn;
    }

    public int getCnt() {
      return cnt;
    }

    public void setCnt(int cnt) {
      this.cnt = cnt;
    }

    // 다른 필드들에 대한 Getter와 Setter 메서드 추가
  }
  %>
  <%
    String searchId = request.getParameter("uId");
    if (searchId != null) {
      searchId = searchId.trim();

      // 검색한 아이디로 회원 정보를 가져오는 SQL 문
      String sql = "SELECT * FROM YNY_TB_USER WHERE U_ID = ?";
      PreparedStatement pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, searchId);
      ResultSet rs = pstmt.executeQuery();

      // 검색 결과가 있는지 확인하고, 결과를 UserInfo 객체에 저장
      UserInfo userInfo = null;
      if (rs.next()) {
	        userInfo = new UserInfo();
	        userInfo.setUId(rs.getString("U_ID"));
	        userInfo.setUName(rs.getString("U_NAME"));
	        userInfo.setPhone(rs.getString("PHONE"));
	        userInfo.setBirth(rs.getString("BIRTH"));
	        userInfo.setEmail(rs.getString("EMAIL"));
	        userInfo.setAddr(rs.getString("ADDR"));
	        userInfo.setBanYn(rs.getString("BANYN"));
	        userInfo.setCnt(rs.getInt("CNT"));
	        // 다른 필드들도 설정
      }

      // 리소스 해제
      rs.close();
      pstmt.close();

      if (userInfo != null) {
    	String phone 
			= userInfo.getPhone() != null ? userInfo.getPhone() : "-";
		String birth 
			= userInfo.getBirth()  != null ? userInfo.getBirth() : "-";
		String email
		=  userInfo.getEmail()  != null ? userInfo.getEmail() : "-";
		String addr
			= userInfo.getAddr() != null ? userInfo.getAddr() : "-";
		String banYn 
			= userInfo.getBanYn().equals("Y") ? "정지" : "";
		String ban 
			= userInfo.getBanYn().equals("Y") ? "해제" : "정지";
		int cnt
			= userInfo.getCnt();
		String cnt2
			=userInfo.getCnt() >= 5 ? "button" : "hidden";

        // 검색 결과를 출력하는 부분
        %>
        <form name="list" action="a_user_update.jsp">
        <h1>검색 결과</h1>
        <table>
          <tr>
          	<th>선택</th>
            <th>아이디</th>
            <th>이름</th>
            <th>핸드폰번호</th>
            <th>생년월일</th>
            <th>이메일</th>
            <th>주소</th>
            <th>정지여부</th>
            <th>정지 해제</th>
            <th>시도횟수</th>
            <th>초기화</th>
            <!-- 다른 필드들의 제목 추가 -->
          </tr>
          <tr>
          	<td><input type="radio" name="user" value="<%= userInfo.getUId()%>"></td>
            <td><%= userInfo.getUId() %></td>
            <td><%= userInfo.getUName() %></td>
            <td><%= phone %></td>
            <td><%= birth %></td>
            <td><%= email %></td>
            <td><%= addr %></td>
            <td><%= banYn %></td>
            <td><input style="background-color: #fdfdd3;" type="button" onclick="bchange('<%=userInfo.getBanYn()%>', '<%=userInfo.getUId() %>')" value=<%= ban %>></td>
            <td><%= cnt %></td>
            <td><input style="background-color: #fdfdd3;" type=<%= cnt2 %> onclick="cnt('<%=userInfo.getUId() %>')" value="초기화"></td>
            <!-- 다른 필드들의 값 추가 -->
          </tr>
        </table>
	<input class="btn_input" type="button" onclick="userUpdate()" value="수정"/>
	<input class="btn_input" type="button" onclick="userRemove()" value="삭제"/>
	<input class="btn_input" type="button" onclick="isback()" value="돌아가기"/>
        <% 
      } else {
        // 검색 결과가 없는 경우
        out.println("<p>검색 결과가 없습니다.</p>");
%>
	<input type="button" onclick="isback()" value="돌아가기"/>
<% 	        
      }
    }
  %>
  </form>
</body>
</html>
<script>
	function isback() {
		location.href = "a_admin.jsp"
	}

	var form = document.list;
	function userRemove(){
		if(!confirm("정말 삭제하시겠습니까?")){
			return;
		}
		   var form = document.list;
		   window.open("a_user_remove.jsp?uId=" + form.user.value,"rpop","width=500, height=300")
	}//userRemove
	
	function bchange(kind,uId){
				if(kind == "N"){
					kind ="Y";
				}else {
					kind = "N"
				}
				window.open("a_user_ban.jsp?uId="+uId+"&kind="+kind,"bpop","width=500, height=300");	
			}
			
	function getReturn(){
				location.reload(); //새로고침
			}		
			
	function cnt(uId){
		window.open("a_cnt_reset.jsp?uId="+uId,"cpop","width=500, height=300");	
	}		
	
	function userUpdate(){
		   if (!confirm("정말 수정하시겠습니까?")) {
		      return;
		   }
		   var form = document.list;
		   window.open("a_user_update.jsp?uId=" + form.user.value,"upop","width=500, height=300");
		}

	function bchange(kind,uId){
		if(kind == "N"){
			kind ="Y";
		}else {
			kind = "N"
		}
		window.open("a_user_ban.jsp?uId="+uId+"&kind="+kind,"bpop","width=500, height=300");	
	}
	
	function cnt(uId){
		window.open("a_cnt_reset.jsp?uId="+uId,"cpop","width=500, height=300");	
	}		
</script>
