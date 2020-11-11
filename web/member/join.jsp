<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Travel Guide :: Join</title>

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

<body id="page-top">

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



<!-- form part -->
<section id="content" class = "page-section" style="margin-top : 100px">

    <div class="container">
        <form action="MemberJoinAction.do" method="post">
            <div class="row justify-content-center">  <!-- row에서 정렬해야 정렬됨 -->
                <div class="col-lg-5">
                    <div class="form-group">
                        <label for="id" >ID</label>
                        <input type="text" class="form-control" id="id" placeholder="ID" name="id">
                    </div>
                    <div class="form-group">
                        <label for="pw" >Password</label>
                        <input type="password" class="form-control" id="pw" name="pw">
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
