<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
        <style>
            @font-face {
                font-family: "a타이틀고딕2";
                src: url("A타이틀고딕2.TTF") format("truetype");
            }
            #container_f {
                position: relative;
                width: 1000px;
                height: 200px;
                font-family: a타이틀고딕2;
                background-color: rgb(245, 233, 224);
                margin: 0px auto;
            }
            #part1,
            #part2,
            #part3 {
                width: 250px;
                float: right;
                margin: 50px auto;
            }
            #f_img {
                position: absolute;
                left: 7%;
                top: 30%;
                width: 100px;
            }
            .제목{
                font-weight: bold;
            }
            .내용{
                font-size: 10px;
            }
            .rborder{
                border-right: 1px solid #000000;
            }
            a{
                text-decoration: none;
                color: yellowgreen;
            }            
        </style>
    </head>

    <body>
        <div id="container_f">
            <div id="part1">
                <div class="제목">전자금융거래 분쟁처리</div>
                <div class="내용">
                    <div>전화 1588-XXXX</div>
                    <div><a href="javascript:;">1:1 문의 바로가기</a></div>
                </div>
            </div>
            <div id="part2">
                <div class="제목">고객센터</div>
                <div class="내용">
                    <div>강원도 춘천시 퇴계로 89 강원전문건설회관</div>
                    <div>wjsghk 1588-XXXX</div>
                    <div>결제도용신고 1588-XXXX</div>
                    <div><a href="javascript:;">1:1문의 바로가기</a></div>
                </div>
            </div>
            <div id="part3">
                <div class="제목"> 네이버㈜</div>
                <div class="내용">
                    <div>사업자등록번호 220-81-62517</div>
                    <div>통신판매업신고번호 2006-인천-0692호</div>
                    <div>대표이사 최인경</div>
                    <span class="rborder">전화 1533-XXXX</span>
                    <span>이메일 XXX@naver.com</span>
                </div>
            </div>
        </div>

    </body>

    </html>