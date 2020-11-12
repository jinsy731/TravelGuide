<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
    <head>

    </head>

    <body>
    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg bg-secondary text-uppercase fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="/TravelGuide/index.do">Travel Guide</a>
            <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">Portfolio</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">About</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">Contact</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="ReserveForm.rsrv">Reserve</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="BoardListAction.board">Board</a></li>

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

    <script src="/TravelGuide/js/login_modal_action.js"></script>
    <script src="/TravelGuide/js/scripts.js"></script>

    </body>
</html>

