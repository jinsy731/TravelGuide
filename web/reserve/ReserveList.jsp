<%@ page import="jsp.reserve.model.ReserveDAO" %>
<%@ page import="jsp.reserve.model.ReserveBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Travel Guide :: Reserved List</title>

    <!-- js, css source include -->
    <jsp:include page="/source.jsp"/>

    <style>
        .reserve-table {
            height: 30px;
            text-align: center;
            table-layout: fixed;
        }
        .reserve-table-item {
            font-size : 10px;
        }


    </style>

</head>
<body>
    <!-- navbar section -->
    <jsp:include page="/navbar.jsp" />

    <!-- 게시판 -->
    <section class="page-section" style="margin-top: 50px">
        <hr>

        <div class="container" id="reserveContainer">
            <div class = "row">
                <div class="col">
                    <p><h5>예약 목록</h5></p>
                    <hr class="custom-hr">
                </div>
                <table class="table table-hover reserve-table" style="text-align:center; border:1px solid #dddddd">
                    <thead>
                    <tr>
                        <th style="background-color: #eeeeee; text-align: center;">번호</th>

                        <th style="background-color: #eeeeee; text-align: center;">출발일</th>

                        <th style="background-color: #eeeeee; text-align: center;">도착일</th>

                        <th style="background-color: #eeeeee; text-align: center;">목적지</th>

                        <th style="background-color: #eeeeee; text-align: center;">상태</th>

                    </tr>
                    </thead>
                    <tbody>
                    <%
                        ArrayList<ReserveBean> list = (ArrayList<ReserveBean>)session.getAttribute("reserve_list");

                        if(list != null) {
                            for(ReserveBean bean : list) {
                                out.print("<tr class=\"reserve-table-item table_item\">");
                                out.print("<td data-field=\"num\" data-formatter=\"LinkFormatter\">"+bean.getReserve_num()+"</td>");
                                out.print("<td>"+bean.getReserve_date_start()+"</td>");
                                out.print("<td>"+bean.getReserve_date_end()+"</td>");
                                out.print("<td>"+bean.getDestination()+"</td>");
                                out.print("<td>"+bean.getReserve_state()+"</td>");
                                out.print("</tr>");
                            }
                        }

                    %>

                    </tbody>

                </table>
            </div>


            <div class="row justify-content-center">

                    <nav aria-label="Page navigation example" >
                        <ul class="pagination">
                            <li class="page-item">
                                <a class="page-link" href="#!" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                    <span class="sr-only">Previous</span>
                                </a>
                            </li>

                            <% int count = (int)session.getAttribute("reserve_list_count"); %>
                            <% for(int i = 1; i <= (count/5)+1; i++) { %>
                            <li class="page-item"><a class="page-link" href="ReserveShowListAction.rsrv?page=<%= i%>"><%= i%></a></li>
                            <% } %>

                            <li class="page-item">
                                <a class="page-link" href="#!" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                    <span class="sr-only">Next</span>
                                </a>
                            </li>
                        </ul>
                    </nav>

            </div>
        </div>
    </section>

    <!-- footer section -->
    <jsp:include page="/footer.jsp"/>
</body>
</html>
