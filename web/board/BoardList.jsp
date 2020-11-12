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

    <script>
        $(document).ready(function (){
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
        })
    </script>

</head>
<body>

    <!-- navbar section -->
    <jsp:include page="/navbar.jsp"/>

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

    <!-- footer section -->
    <jsp:include page="/footer.jsp"/>

    </body>

</html>
