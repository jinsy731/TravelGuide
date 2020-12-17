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

        .boardlist-subject {
            font-size : 30px;
            color : #2f4559;
        }

        .boardlist-content {
            font-size : 15px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3; /* 라인수 */
            -webkit-box-orient: vertical;
            word-wrap:break-word;
            line-height: 1.2em;
            height: 2.6em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
        }
    </style>

</head>
<body>

    <!-- navbar section -->
    <jsp:include page="/navbar.jsp"/>

    <!-- 게시판 -->
    <section class="page-section">
        <header style="background-image : url('${pageContext.request.contextPath}/assets/img/창경궁4.jpeg'); background-size : cover; background-repeat: no-repeat; background-position: bottom">
            <div style="width: 800px; height: 400px"></div>
            <div class="font-weight-bold display-4 text-white" style="padding : 100px">여행 후기/여행지 추천</div>
        </header>
        <div class="container mt-5">

             <div class="list-group">
            <%
                ArrayList<BoardBean> list = (ArrayList<BoardBean>)session.getAttribute("boardlist");
                for(BoardBean bean : list) {

                    out.print("<a href=\"BoardShowContentAction.board?board_num="+ bean.getBoard_num() +"\" class=\"list-group-item-custom list-group-item-action flex-column align-items-start\" style=\"padding-left : 100px; padding-right : 100px;\"> ");
                    out.print("     <div class=\"d-flex w-80 justify-content-between\">");
                    out.print("         <p class=\"boardlist-subject mb-3\">"+bean.getBoard_subject() +"</p>\n");
                    out.print("         <small>"+ bean.getBoard_date()+"</small>\n");
                    out.print("     </div>");
                    out.print(" <p class=\"mb-1 boardlist-content\">"+ bean.getBoard_content()+"</p>");
                    out.print("<small>"+ bean.getBoard_owner_id()+"</small>\n");
                    out.print("</a>");

                }

            %>
             </div>

            <div class="row justify-content-between mt-5">
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
                    <button class="btn btn-secondary pull-right right float-right" id="btn_write">글쓰기</button>
            </div>
        </div>
    </section>

    <!-- footer section -->
    <jsp:include page="/footer.jsp"/>

    </body>

</html>



