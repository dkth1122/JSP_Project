<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 내용</title>
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
        height: 300px;
        margin: 0px auto;
        margin-top: 10px;
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
		margin: 10px 1px;
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
	        top : 0%;
	        left: 38%;
		}
	
	.q-1{
		margin: 24px;
	}
	
	.in1{
		width : 300px;
		height: 100px;
		border-color: pink;
	}
	
		.in2{
		border-color: pink;
	}
</style>
</head>
<body>
   <%@ include file="jdbc_set.jsp" %>
   
   <% 
      request.setCharacterEncoding("UTF-8");
      String qNo = request.getParameter("qNo");
      PreparedStatement pstmt = null;
      ResultSet rs = null;
      session.setAttribute("qNo", qNo);
      
      try {
         String sql = "SELECT * FROM YNY_TB_CHECK WHERE Q_NUM = ?";
         pstmt = conn.prepareStatement(sql);
         pstmt.setInt(1, Integer.parseInt(qNo));
         rs = pstmt.executeQuery();
         
         if (rs.next()) {
            String qTitle = rs.getString("Q_TITLE");
            String qContent = rs.getString("Q_CONTENT");
            String content2 = rs.getString("A_CONTENT");
            if (content2 == null) {
               content2 = "내용없음";
            }
            %>
            <fieldset>
            <div>문의 제목 : <%= qTitle %></div>
            <div>문의 내용 : <%= qContent %></div>
            <form action="a_QnA_Status.jsp" name="inquiry_form">
               	<div style="margin-top: 32px;">답변 내용</div>
                  <textarea cols="30" rows="5"  name="a_text" value="<%= content2 %>"></textarea>
                <div>
                  <select name="a_ticket">
                     <option value="" selected>티켓상태</option>
                     <option value="O">OPEN</option>
                     <option value="P">PENDING</option>
                     <option value="C">CLOSE</option>
                  </select>
                  </div>
               <input class="btn_input" type="button" onclick="answer();" value="답변하기">
            </form>
            </fieldset>
            <%
         } else {
            out.println("문의 내용을 조회할 수 없습니다.");
         }
         
      } catch (SQLException e) {
         out.println("문의 내용 조회 중 오류가 발생했습니다.<br>");
         out.println("SQLException: " + e.getMessage());
      }
   %>
</body>
<script>
   function answer() {
        var form = document.inquiry_form;
        if (form.a_ticket.value == "") {
          alert("티켓 상태를 설정해주세요.");
          form.a_ticket.focus();
        } else {
        form.submit();
      }
   }
</script>