<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>
        <title>Travel Guide :: Reservation</title>

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

        <!-- Bootstrap-DatePicker(TempusDominus) 다음 순서대로 넣어야 적용됨-->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js" integrity="sha512-LGXaggshOkD/at6PFNcp2V2unf9LzFq6LE+sChH7ceMTDP0g2kn6Vxwgg7wkPP7AAtX+lmPqPdxB47A0Nz0cMQ==" crossorigin="anonymous"></script>        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.7/js/tether.min.js" integrity="sha512-X7kCKQJMwapt5FCOl2+ilyuHJp+6ISxFTVrx+nkrhgplZozodT9taV2GuGHxBgKKpOJZ4je77OuPooJg9FJLvw==" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/js/tempusdominus-bootstrap-4.min.js" integrity="sha512-2JBCbWoMJPH+Uj7Wq5OLub8E5edWHlTM4ar/YJkZh3plwB2INhhOC3eDoqHm1Za/ZOSksrLlURLoyXVdfQXqwg==" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/css/tempusdominus-bootstrap-4.min.css" integrity="sha512-PMjWzHVtwxdq7m7GIxBot5vdxUY+5aKP9wpKtvnNBZrVv1srI8tU6xvFMzG8crLNcMj/8Xl/WWmo/oAP/40p1g==" crossorigin="anonymous" />


        <script type="text/javascript">

            $(function () {
                $('#datetimepicker7').datetimepicker( {
                    format : 'YYYY년 MM월 DD일 HH:mm'
                });
                $('#datetimepicker8').datetimepicker({
                    format : 'YYYY년 MM월 DD일 HH:mm',
                    useCurrent: false
                });
                $("#datetimepicker7").on("change.datetimepicker", function (e) {
                    $('#datetimepicker8').datetimepicker('minDate', e.date);
                });
                $("#datetimepicker8").on("change.datetimepicker", function (e) {
                    $('#datetimepicker7').datetimepicker('maxDate', e.date);
                });
            });

        </script>

    </head>
<body>
    <!-- Navigation -->
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="index.do">Travel Guide Project</a>
            <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded"
                    type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive"
                    aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                                                         href="#portfolio">Portfolio</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                                                         href="#about">About</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger"
                                                         href="#contact">Contact</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href=#
                                                         id="gotoBoard">Board</a></li>

                    <% if (session.getAttribute("sessionID") == null) {
                        out.print("        <li class=\"nav-item mx-0 mx-lg-1\"><a class=\"nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger\" data-toggle=\"modal\" data-target=\"#loginModal\">Login</a></li>\n");
                    } else {
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
                                        <input class="form-control" id="id" name="id" type="text" placeholder="ID"
                                               required="required"
                                               data-validation-required-message="Please enter your ID."/>
                                        <p class="help-block text-danger"></p>
                                    </div>
                                </div>

                                <div class="control-group">
                                    <div class="form-group floating-label-form-group controls mb-0">
                                        <label>Password</label>
                                        <input class="form-control" id="pw" name="pw" type="password" placeholder="Password"
                                               required="required"
                                               data-validation-required-message="Please enter your Password."/>
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
    </div> <!-- login modal end -->
    <!-- nav part end -->

    <section class="page-section" style="margin-top: 100px">
        <div class="container">

            <div class="row">
                <!-- Calendar -->
                <div class="col-md-4">
                    <div class="form-group">
                        <label for="datetimepicker7">출발일</label>
                        <div class="input-group date" id="datetimepicker7" data-target-input="nearest">
                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker7"/>
                            <div class="input-group-append" data-target="#datetimepicker7" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="datetimepicker8">도착일</label>
                        <div class="input-group date" id="datetimepicker8" data-target-input="nearest">
                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker8"/>
                            <div class="input-group-append" data-target="#datetimepicker8" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

            <div class="row">

                <div class="col-md-2">
                    <label for="destList">목적지</label>
                    <div class="input-group">
                        <div class="input-group-prepend">
                            <button id="destList" class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</button>
                            <div class="dropdown-menu">
                                <a class="dropdown-item" href="#">Action</a>
                                <a class="dropdown-item" href="#">Another action</a>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-6">
                    <label for="courseList">코스 목록</label>
                    <div id="courseList">



                    </div>
                </div>
            </div>

        </div>
    </section>


</body>
</html>
