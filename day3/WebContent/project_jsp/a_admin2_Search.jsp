<%@page import="java.rmi.server.UID"%>
<%@page import="javax.websocket.OnClose"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    *{
        font-family: a타이틀고딕2;
    }
    body {
        text-align: center;
        font-size: 24px;
    }
    th {
        background-color: pink;
    }
    table{
        border-collapse: collapse;
    }
    td, th {
        border: 1px solid black;
        padding: 0px 12px;
    }
    .btn{
        width: 50px;
        margin: 10px auto;
    }
    
</style>
</head>
<body>
<%@ include file="jdbc_set.jsp"%>

<form name="list" action="a_QnA_Search.jsp">
    <%-- 테이블에 id 추가 --%>
    <table id="qnaTable">
        <tr>
            <th>문의 번호</th>
            <th>아이디</th>
            <th>문의 날짜</th>
            <th>제목</th>
            <th>문의 상태</th>
            <th>답변</th>
        </tr>
        <%
            ResultSet rs = null;
            Statement stmt = null;
            String uId1 = request.getParameter("searchId");
            boolean tableVisible = true; // 테이블이 보일지 여부를 결정하는 변수
            try {
                String sql = "SELECT * FROM YNY_TB_USER U LEFT JOIN YNY_TB_CHECK C ON U.U_ID = C.U_ID WHERE STATUS = 'U' AND C.U_ID = '"+ uId1 +"' AND Q_NUM IS NOT NULL ORDER BY Q_NUM ASC";
                stmt = conn.createStatement();
                rs = stmt.executeQuery(sql);
                
                if (!rs.next()) { // 데이터가 없는 경우
                    tableVisible = false; // 테이블을 숨기도록 변수 설정
%>
        <tr>
            <td colspan="6">해당하는 아이디의 문의가 없습니다.</td>
        </tr>
<%
                } else { // 데이터가 있는 경우
                    rs.beforeFirst(); // rs.next()로 인해 커서가 다음으로 이동했으므로 다시 이전으로 이동시킴

                    while (rs.next()) {
                        String uId = rs.getString("U_ID");
                        String qna_d = rs.getString("Q_TIME") != null ? rs.getString("Q_TIME") : "-";
                        String qna_t = rs.getString("Q_TITLE") != null ? rs.getString("Q_TITLE") : "-";
                        String qna = rs.getString("Q_NUM") != null ? rs.getString("Q_NUM") : "-";
                        
                        String qnaa = rs.getString("Q_STATUS");
                        String qnaa2 = "";

                        qnaa2 = (qnaa == null) ? "-" : (qnaa.equals("O") ? "OPEN" : (qnaa.equals("P") ? "PENDING" : "CLOSE"));
                        String qstyle = "";
                        if (qnaa2.equals("OPEN")) {
                            qstyle = "red";
                        }else if(qnaa2.equals("PENDING")) {
                            qstyle = "blue";
                        }else if(qnaa2.equals("CLOSE")) {
                            qstyle = "black";
                        }
                        
                        String aChe = rs.getString("Q_STATUS").equals("C") ? "수정" : "답변";
      
        %>
        <tr>
            <td><%=qna%></td>
            <td><%=uId%></td>
            <td><%=qna_d%></td>
            <td><%=qna_t%></td>
            <td style="color:<%= qstyle %>"><%=qnaa2%></td>
            <td><input type="button" value="<%= aChe %>" onclick="qq_a(<%=qna%>)"></td>
        </tr>
<% 
                    }// end while
                }// end else
            } catch (SQLException ex) {
                tableVisible = false; // 테이블을 숨기도록 변수 설정
                out.println("해당 아이디를 사용하고 있는 사용자가 없습니다.");
               	/* out.println("SQLException: " + ex.getMessage()); */
            } 
        %>
    </table>
    <%-- 테이블을 보이거나 숨기는 JavaScript 코드 --%>
    <script>
        var tableVisible = <%= tableVisible %>;
        if (!tableVisible) {
            document.getElementById("qnaTable").style.display = "none";
        }
    </script>
    <input type="button" onclick="isback()" value="돌아가기"/>
</form>
</body>
</html>
<script>
    function isback() {
        location.href = "a_admin2.jsp"
    }
    var form = document.list;
        
                
    function getReturn(){
        location.reload(); //새로고침
    }        
    
    function qq_a(qNo) {
        window.open("a_QnA_Answer.jsp?qNo=" + qNo,"popup1", "width=500, height=500");
    }
</script>
