<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Travel Guide :: Join</title>
        <jsp:include page="../source.jsp"/>
        <script src = "/TravelGuide/js/join.js"></script>

        <script>

        </script>

    </head>

    <body id="page-top">

        <!-- navbar include -->
        <jsp:include page="/navbar.jsp"/>


        <!-- form part -->
        <section id="content" class = "page-section" style="margin-top : 50px">
            <hr>
            <div class="container">
                <div class="row">
                    <div class="col">
                        <p><h5>회원가입</h5></p>
                        <hr class="custom-hr">
                    </div>
                </div>
                <form action="MemberJoinAction.do" method="post" onsubmit="return joinSubmit(event)">

                    <input type="hidden" id="JOIN_USER_ID" name="JOIN_USER_ID" value="default">
                    <input type="hidden" id="JOIN_USER_PW" name="JOIN_USER_PW" value="default">

                    <div class="row justify-content-center">  <!-- row에서 정렬해야 정렬됨 -->
                        <div class="col-lg-5">
                            <div class="form-group">
                                <label for="joinId" >ID</label>
                                <input type="text" class="form-control" id="joinId" placeholder="ID" name="id">
                                <button type="button" id="idDupCheckBtn" class="btn-sm btn-secondary mt-3" onclick="return idDupCheck()">ID 중복체크</button>
                            </div>
                            <div class="form-group">
                                <label for="joinPw" >Password</label>
                                <input type="password" class="form-control" id="joinPw" name="pw">
                            </div>
                            <div class="form-group">
                                <label for="email" >email</label>
                                <input type="email" class="form-control" id="email" name="email">
                            </div>
                            <div class="form-group">
                                <label for="name" >Name</label>
                                <input type="text" class="form-control" id="name" name="name">
                            </div>
                            <div class="form-group">
                                <label for="name" >Address</label>
                                <input type="text" class="form-control" id="addr" name="addr">
                            </div>
                            <div class="form-group">
                                <label for="name" >Phone</label>
                                <input type="text" class="form-control" id="phone" name="phone">
                            </div>
                            <div class="form-group">
                                <label for="name" >Gender</label>
                                <input type="text" class="form-control" id="gender" name="gender">
                            </div>
                            <div class="form-group form-inline">
                                <label for="name" >Birth</label>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="date_yy" name="date_yy">
                                    <div class="input-group-append"><div class="input-group-text">년</div></div>

                                    <input type="text" class="form-control" id="date_mm" name="date_mm">
                                    <div class="input-group-append"><div class="input-group-text">월</div></div>

                                    <input type="text" class="form-control" id="date_dd" name="date_dd">
                                    <div class="input-group-append"><div class="input-group-text">일</div></div>


                                </div>

                            </div>
                            <div class="form-group">
                                <label for="name" >Hint</label>
                                <input type="text" class="form-control" id="hint" name="hint">
                            </div>
                            <div class="form-group" align="center">
                                <button type="submit" class="btn btn-secondary" name="btn" value="BTN_SIGNUP">SIGNUP</button>
                            </div>

                        </div>
                    </div>

                </form>

            </div> <!-- container end -->

            <!-- form part end -->

        </section>

    </body>
</html>
