<%@ page import="jsp.board.model.BoardBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
    <title>Travel Guide :: Board List</title>

    <jsp:include page="/source.jsp"/>

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

    <style>
        .board-table {
            height: 30px;
            text-align: center;
            table-layout: fixed;
        }
        .board-table-item {
            font-size : 10px;

        }
    </style>

</head>
<body>

    <!-- navbar section -->
    <jsp:include page="/navbar.jsp"/>

    <!-- 게시판 -->
    <section class="page-section" style="margin-top: 50px">
        <hr>
        <div class="container">
            <div class="row">
                <div class="col">
                    <p><h5>게시판</h5></p>
                    <hr class="custom-hr">
                </div>
            </div>
            <div class = "row justify-content-center">
                <table class="table table-hover">
                <thead>
                    <tr class="board-table">
                        <th style="width: 50px">번호</th>

                        <th style="width: 300px">제목</th>

                        <th style="width: 100px">작성자</th>

                        <th style="width: 100px">작성일</th>
                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<BoardBean> list = (ArrayList<BoardBean>)session.getAttribute("boardlist");
                        for(BoardBean bean : list) {
                            out.print("<tr class=\"board-table board-table-item table_item\">");
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


            <div class="row justify-content-between">
                <div></div>
                    <nav aria-label="Page navigation example" >
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#!" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>

                            <% int count = (int)session.getAttribute("listcount"); %>
                            <% for(int i = 1; i < (count/5)+1; i++) { %>
                            <li class="page-item"><a class="page-link" href="BoardListAction.board?page=<%= i%>"><%= i%></a></li>
                            <% } %>

                            <li class="page-item">
                                <a class="page-link" href="#!" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>
                    <button class="btn btn-primary pull-right right float-right" id="btn_write">글쓰기</button>
            </div>
        </div>
    </section>

    <!-- footer section -->
    <jsp:include page="/footer.jsp"/>

    </body>

</html>



