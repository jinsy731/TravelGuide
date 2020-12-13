<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>
        </title>
        <jsp:include page="../source.jsp"/>
        <script src="/TravelGuide/js/mypage.js"></script>

        <style>
            #mypageNav {
                font-size : 12px;
            }
            #mypageNav > a {
                color : #000;
            }
            #mypageNav > a:hover {
                color : #727272;
            }
            #mypage hr {
                margin-top: 0.5rem;
                margin-bottom: 0.5rem;
                border: 0;
                border-top: 0.05rem solid rgba(0, 0, 0, 0.1);
            }
            #mypageContent span{
                font-size : 10px;
                color : #979797;
                margin-right : 20px;
            }
            #userInfo p {
                font-size : 15px;
                padding-top : 0.75rem;
                padding-bottom: 0.75rem;
            }
        </style>

    </head>

    <body>

        <jsp:include page="../navbar.jsp"/>
        <section class="page-section" style="margin-top: 50px">
            <div class="container" id="mypage" style="max-width: 720px">
                <nav class="nav" id="mypageNav">
                    <a href="#" class="nav-link" id="viewInfo">회원정보 조회</a>
                    <a href="#" class="nav-link" id="secession">회원 탈퇴</a>
                    <a href="#" class="nav-link" id="changePassword">비밀번호 변경</a>

                </nav>
                <hr>
                <div class="row ml-5 mt-3" >
                    <div class="col" id="mypageContent">

                    </div>
                </div>

            </div>

        </section>

        <jsp:include page="../footer.jsp"/>
    </body>
</html>