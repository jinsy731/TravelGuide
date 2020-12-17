<%@ page import="jsp.reserve.model.ReserveDAO" %>
<%@ page import="jsp.reserve.model.ReserveBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.util.List" %>
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

         .attr-card-img {
             width: 100%;
             height: 200px;
             object-fit: cover;
             overflow: auto;
         }

        .attr-card-btn-text {
            font-size: 15px;
        }

        /*<!-- ellipse로 글자 수 제한 -->*/

        .attr-card-text {
            font-size : 13px;
            overflow: hidden;
            text-overflow: ellipsis;
            display: -webkit-box;
            -webkit-line-clamp: 3; /* 라인수 */
            -webkit-box-orient: vertical;
            word-wrap:break-word;
            line-height: 1.2em;
            height: 3.6em; /* line-height 가 1.2em 이고 3라인을 자르기 때문에 height는 1.2em * 3 = 3.6em */
        }

        .attr-card-price {
            font-size : 12px;
            color: #b0afb2;
        }

        .total-price-text {
            font-size : 25px;
            color: #4a5464;
            font-weight: bolder;
        }

        .total-price-text2 {
            font-size : 15px;
            color: #6c757d;

        }


    </style>

    <script>
        $(function() {
           var total_price = 0;
           var $price = $('.card-group').find('span.attr-card-price');
           $price.each(function() {
               console.log(Number($(this).text()));
               total_price = Number(total_price) + Number($(this).text());
               console.log(total_price);
               $(this).html('결제 금액 : &#8361;' + comma($(this).text()));
           });

            $('#total-price').html('&#8361;' + total_price);

        });

        function deleteCheck() {
            var check = confirm("삭제 하시겠습니까?");
            return check;
        }

        function payCheck() {
            var check = confirm("결제 하시겠습니까?");
            return check;
        }


        function comma(num){
            var len, point, str;

            num = num + "";
            point = num.length % 3 ;
            len = num.length;

            str = num.substring(0, point);
            while (point < len) {
                if (str != "") str += ",";
                str += num.substring(point, point + 3);
                point += 3;
            }

            return str;

        }
    </script>

</head>
<body>
    <!-- navbar section -->
    <jsp:include page="/navbar.jsp" />

    <!-- 게시판 -->
    <section class="page-section" style="margin-top: 50px">
        <hr>

        <div class="container" id="reserveContainer">

            <div class="row justify-content-center">
                <div class="card-group">
                    <% ArrayList<ReserveBean> bean = (ArrayList<ReserveBean>) session.getAttribute("reserve_list"); %>
                    <% List<String> img = (ArrayList<String>) session.getAttribute("reserve_img"); %>
                    <% int size = bean.size(); %>
                    <% for(int i=0; i < size; i++) { %>
                    <div class="col-md-4 col-lg-4 col-sm-4">
                        <div class="card" style="margin-top: 100px">
                            <img class="card-img-top attr-card-img" src="<%= img.get(i)%>" alt="Card image cap">
                            <div class="card-body">
                                <h4 class="card-title"><%= bean.get(i).getDestination()%></h4><br>
                                <p class="attr-card-text">출발일 : <%= bean.get(i).getReserve_date_start()%></p>
                                <p class="attr-card-text">도착일 : <%= bean.get(i).getReserve_date_end()%></p>

                                <span class="attr-card-price mr-5"><%= bean.get(i).getReserve_price()%></span>
                                <form action="ReserveDelete.rsrv" method="post" onsubmit="return deleteCheck()">
                                    <button class="btn btn-outline-dark itemDelete" type="submit">삭제</button>
                                    <input type="hidden" name="reserve_num" value="<%= bean.get(i).getReserve_num()%>">
                                </form>
                            </div>
                        </div>
                    </div>
                    <% } %>

                </div>
            </div>

            <div class="row rounded border border-light p-5 mt-5 mb-5">
               <span class="total-price-text mr-3">전체 결제 금액  </span> <span class="total-price-text2" id="total-price"></span>
                <a href="ReservePay.rsrv" type="button" class="btn btn-secondary" style="margin-left: 400px" onclick="return payCheck()">결제하기</a>
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
