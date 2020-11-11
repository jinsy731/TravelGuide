<%@ page import="jsp.board.model.BoardBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Travel Guide :: Board List</title>

    <!-- Popper js -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>

    <!-- Bootstrap core JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Third party plugin JS-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

    <!-- Font Awesome icons (free version)-->
    <script src="https://use.fontawesome.com/releases/v5.15.1/js/all.js" crossorigin="anonymous"></script>
    <!-- Google fonts-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css" />
    <link href="https://fonts.googleapis.com/css?family=Lato:400,700,400italic,700italic" rel="stylesheet" type="text/css" />

    <!-- Core theme CSS (includes Bootstrap) 부트스트랩 포함 css-->
    <link href="css/styles.css" rel="stylesheet" />

</head>
<body>

    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="index.do">Travel Guide Project</a>
            <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">Portfolio</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">About</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">Contact</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href=# id="gotoBoard" >Board</a></li>

                    <% if(session.getAttribute("sessionID") == null) {
                        out.print("        <li class=\"nav-item mx-0 mx-lg-1\"><a class=\"nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger\" data-toggle=\"modal\" data-target=\"#loginModal\">Login</a></li>\n");
                    }
                    else {
                        out.print("        <li class=\"nav-item mx-0 mx-lg-1\"><a class=\"nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger\" href=\"MemberLogoutAction.do\">Logout</a></li>\n");
                    }
                    %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Login Modal -->
    <div class="modal fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModal" aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="loginModalLabel">Login</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <form id="loginForm" name="sentloginInfo" method="post">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-lg-10 mx-auto">

                                <div class="control-group">
                                    <div class="form-group floating-label-form-group controls mb-0">
                                        <label>ID</label>
                                        <input class="form-control" id="id" name="id" type="text" placeholder="ID" required="required" data-validation-required-message="Please enter your ID." />
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="form-group floating-label-form-group controls mb-0">
                                        <label>Password</label>
                                        <input class="form-control" id="pw" name="pw" type="password" placeholder="Password" required="required" data-validation-required-message="Please enter your Password." />
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="submit" class="btn btn-secondary" id="joinSubmit">Join</button>
                        <button type="submit" class="btn btn-primary" id="loginSubmit">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- nav part end -->

    <!-- 게시판 -->
    <section class="page-section" style="margin-top: 100px">

        <div class="container">
            <div class = "row">
                <table class="table table-striped table-hover" style="text-align:center; border:1px solid #dddddd">
                    <thead>
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">번호</th>

                        <th style="background-color: #eeeeee; text-align: center;">제목</th>

                        <th style="background-color: #eeeeee; text-align: center;">작성자</th>

                        <th style="background-color: #eeeeee; text-align: center;">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<BoardBean> list = (ArrayList<BoardBean>)session.getAttribute("boardlist");
                        for(BoardBean bean : list) {
                            out.print("<tr class=\"table_item\">");
                            out.print("<td data-field=\"num\" data-formatter=\"LinkFormatter\">"+bean.getBoard_num()+"</td>");
                            out.print("<td>"+bean.getBoard_subject()+"</td>");
                            out.print("<td>"+bean.getBoard_owner_id()+"</td>");
                            out.print("<td>"+bean.getBoard_date()+"</td>");
                            out.print("</tr>");
                        }

                    %>

                    </tbody>

                </table>
            </div>


            <div class="row">

                    <nav aria-label="Page navigation example" >
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#!" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>
                            <li class="page-item"><a class="page-link" href="#!">1</a></li>
                            <li class="page-item"><a class="page-link" href="#!">2</a></li>
                            <li class="page-item"><a class="page-link" href="#!">3</a></li>
                            <li class="page-item">
                                <a class="page-link" href="#!" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <button class="btn btn-primary pull-right " id="btn_write">글쓰기</button>

                </div>

        </div>

    </section>

        <script>

            $(document).ready( function () {
                $('.table_item').click( function () {
                    var num = $(this).children().eq(0).text();
                    location.href = "BoardShowContentAction.board?board_num="+num;
                })


                <c:if test="${sessionScope.sessionID != null}" var="loginCheck"></c:if>

                $('#btn_write').click( function () {
                    var check = '<c:out value="${loginCheck}"/>';
                    if( check == 'false') {
                        alert("로그인 후 이용 가능합니다.");
                        return false;
                    }
                    else {
                        location.href = "BoardWrite.board";
                    }
                });

                // LoginSubmit Event Handler
                $("#loginSubmit").on("click", function (event) {
                    event.preventDefault();

                    if($("#id").val() == '' || $("#pw").val() == '') { alert("아이디와 비밀번호를 입력해주세요."); return false;}
                    var form_data = {
                        id: $("#id").val(),
                        pw: $("#pw").val()
                    };

                    $.ajax({
                        url: "MemberLoginAction.do",
                        type: "POST",
                        data: form_data,
                        dataType : "text",
                        success: function (data) {
                            if(data.trim() == 'success') {
                                location.href = "BoardListAction.board";
                            }
                            if(data.trim() == 'wrong_id') {
                                alert("존재하지 않는 아이디입니다.");
                            }
                            else if(data.trim() == 'wrong_pw') {
                                alert("비밀번호가 다릅니다.");
                            }
                        },
                        error: function () {
                            alert("error");
                        }
                    });
                });  // loginSubmit Event Handler end

                $('#joinSubmit').click( function() {
                    location.href = "JoinForm.do";
                });


            })

        </script>

    </body>

</html>
