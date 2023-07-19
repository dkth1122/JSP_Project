<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>멤버십</title>
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
		color:rgb(255, 99, 146);
		font-family: a타이틀고딕2;
	}

	body {
		margin: 0px 0px;
		background-color: #fdfdd3;
	}
	
	#container {
		width: 600px;
		margin: 10px auto;
	}

    img{
        width: 400px;
    }
    
	fieldset {
        width: 500px;
        height: 400px;
        margin: 0px auto;
        margin-top: 350px;
        margin-bottom: 32px;
		background-color: white;
        border: 3px dashed pink;
        border-radius: 50px;
        text-align: center;
	}
	
	#f-d
	{
		font-family: "삼립호빵";
		color:rgb(255, 99, 146);
		font-size: 32px;
	}
	
	.btn_input {
		width: 100px;
	  	height: 24px;
		font-size: 15px;
		font-family: a타이틀고딕2;
		color:rgb(255, 99, 146);
		border-radius: 30px;
		border:1px solid pink;
		background-color: #fdfdd3;
		cursor: pointer;
		margin: 12px 1px;
	}
	.a{
		border:1px solid pink;
		margin: 12px auto;
	}

	
	input:focus { 
		outline: none !important; border-bottom-color: pink; box-shadow: 0 0 10px #d6a8e9; 
		}
	
	#gam:hover {
	cursor: pointer;
	}
	
	#gam{
			position: absolute;
	        top : -10%;
	        left: 38%;
		}
		
    </style>
</head>
<body>
    <%@ include file="jdbc_set.jsp" %>
     <img id="gam" onclick="isback()" src = "img/king_potato.png-removebg-preview.png">
     	<fieldset>
    <div id="f-d">멤버십 정보</div>
    <%
        request.setCharacterEncoding("UTF-8");

        String uId = (String) session.getAttribute("uId");

        try {
            // 멤버십 정보 조회
            PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM YNY_TB_MEMBERSHIP WHERE U_ID = ?");
            pstmt.setString(1, uId);
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
            	String num = rs.getString("MEM_NUM");
                String regDate = rs.getString("REG_DATE");
                String expDate = rs.getString("EXP_DATE");
                String status = rs.getString("STATUS");

                // 멤버십 정보 표시
    %>
                <h2>회원님의 멤버십 정보</h2>
                <p>회원번호: <%= num %></p>
                <p>등록일: <%= regDate %></p>
                <p>만료일: <%= expDate %></p>
                <p>상태: <%= status %></p>
    <%
            } else {
                // 멤버십 정보가 없는 경우
    %>
                <h2>멤버십 정보 없음</h2>
                <p>멤버십을 구독 또는 연장해주세요.</p>
    <%
            }

            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            out.println("SQLException: " + e.getMessage());
        }
    %>
    <form action="u_Membership_A_Process.jsp" method="post">
        구독 개월 수: <input class="a" type="number" name="subscriptionMonths" required>
        <input class="btn_input" type="submit" value="멤버십 추가">
    </form>

    <form action="u_Membership_C_Process.jsp" method="post">
        회원번호: <input class="a" type="text" name="memNum" required>
        <input class="btn_input" type="submit" value="멤버십 취소">
    </form>
    
    <input class="btn_input" type="button" onclick="isback()" value="돌아가기">
  </fieldset>
</body>
</html>
<script>
	function isback() {
		location.href = "u_mypage.jsp";
	}
</script>
