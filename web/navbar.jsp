<%@ page contentType="text/html;charset=UTF-8" language="java" %>

    <!-- Navigation-->
    <nav class="navbar navbar-expand-lg bg-white text-uppercase text-dark fixed-top" id="mainNav">
        <div class="container">
            <a class="navbar-brand js-scroll-trigger" href="/TravelGuide/index.do">Travel Guide</a>
            <button class="navbar-toggler navbar-toggler-right text-uppercase font-weight-bold bg-primary text-white rounded" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                Menu
                <i class="fas fa-bars"></i>
            </button>
            <div class="collapse navbar-collapse" id="navbarResponsive">
                <ul class="navbar-nav ml-auto">
<%--                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#portfolio">Portfolio</a></li>--%>
<%--                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#about">About</a></li>--%>
<%--                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="#contact">Contact</a></li>--%>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="ReserveFormLoadAction.rsrv">Reserve</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="BoardListAction.board?page=1">Community</a></li>
                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="AttractionList.attr">Attraction</a></li>

                    <li class="nav-item mx-0 mx-lg-1"><a class="nav-link py-3 px-0 px-lg-3 rounded js-scroll-trigger" href="Mypage.do">Mypage</a></li>

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
                <div class="modal-body">
                    <!-- Default form login -->
                    <form class="text-center border border-light p-5" action="#!">

                        <p class="h4 mb-4">Sign in</p>

                        <!-- for RSA encrypt -->
                        <input type="hidden" id="RSAModulus" value="${RSAModulus}"/>
                        <input type="hidden" id="RSAExponent" value="${RSAExponent}"/>

                        <input type="hidden" id="USER_ID" name="USER_ID">
                        <input type="hidden" id="USER_PW" name="USER_PW">

                        <!-- id -->
                        <input type="text" id="formId" class="form-control mb-4" placeholder="ID">

                        <!-- Password -->
                        <input type="password" id="formPw" class="form-control mb-4" placeholder="Password">

                        <div class="d-flex justify-content-around">
                            <div>
                                <!-- Remember me -->
                                <div class="custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="defaultLoginFormRemember">
                                    <label class="custom-control-label" for="defaultLoginFormRemember">Remember me</label>
                                </div>
                            </div>
                            <div>
                                <!-- Forgot password -->
                                <a href="./member/ForgotPassword.jsp" target="_blank" onClick="window.open('./member/ForgotPassword.jsp ','비밀번호 찾기','resizable,height=500,width=400,top=200,left=600'); return false;">Forgot password?</a>
                            </div>
                        </div>

                        <!-- Sign in button -->
                        <button class="btn btn-secondary btn-block my-4" type="submit" id="loginSubmit">Sign in</button>

                        <!-- Register -->
                        <p>Not a member?
                            <a href="JoinForm.do">Register</a>
                        </p>

                        <!-- Social login -->
<%--                        <p>or sign in with:</p>--%>

<%--                        <a href="#" class="mx-2" role="button"><i class="fab fa-facebook-f light-blue-text"></i></a>--%>
<%--                        <a href="#" class="mx-2" role="button"><i class="fab fa-twitter light-blue-text"></i></a>--%>
<%--                        <a href="#" class="mx-2" role="button"><i class="fab fa-linkedin-in light-blue-text"></i></a>--%>
<%--                        <a href="#" class="mx-2" role="button"><i class="fab fa-github light-blue-text"></i></a>--%>

                    </form>
                    <!-- Default form login -->
                </div>
                <div class="modal-footer"></div>
            </div>

        </div>
    </div>

    <script src="/TravelGuide/js/login_modal_action.js"></script>
    <script src="/TravelGuide/js/scripts.js"></script>
