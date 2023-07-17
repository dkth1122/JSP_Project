<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   body{
      background-color: #023047;
   }

</style>
</head>
<body>
   
<% String id = (String)session.getAttribute("id");
   session.setAttribute("uId", id);
   %>
   <form action="u_QnA_Upload.jsp" name="check">
      <div>제목 : <input type="text" name="tit"></div>
      <div>내용 : <input type="text" name="cont"></div>
      <div><input onclick="btn()" type="button" value="제출하기"></div>
      <div><input onclick="isback()" type="button" value="돌아가기"></div>

   
   </form>
</body>
<script>
   var form = document.check;
   
   function btn() {
   if(form.tit.value == "" || form.tit.value == undefined){
      alert("제목을 입력해주세요");
      form.tit.focus();
      return;
   }
   if(form.cont.value == "" || form.cont.value == undefined){
      alert("내용을 입력해주세요");
      form.cont.focus();
      return;
   }
      form.submit();
   }

   function isback() {
      location.href="home_main_login.jsp"; 
   } 
</script>
</html>