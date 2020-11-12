<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Travel Guide :: Reserved List</title>
    <jsp:include page="/source.jsp"/>

</head>
<body>
    <!-- navbar section -->
    <jsp:include page="/navbar.jsp" />


    <!-- 게시판 -->
    <section class="page-section" style="margin-top: 100px">

        <div class="container">
            <div class = "row">
                <table class="table table-striped table-hover" style="text-align:center; border:1px solid #dddddd">
                    <thead>
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">번호</th>

                        <th style="background-color: #eeeeee; text-align: center;">출발일</th>

                        <th style="background-color: #eeeeee; text-align: center;">도착일</th>

                        <th style="background-color: #eeeeee; text-align: center;">목적지</th>

                        <th style="background-color: #eeeeee; text-align: center;">예약 코스</th>

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