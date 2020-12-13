<%@ page import="jsp.attraction.model.AttractionReviewBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: jinsy
  Date: 2020-12-13
  Time: 오전 5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../source.jsp"/>

    <style>
        .attr-content-img {
            width: 100%;
            height: 400px;
            object-fit: cover;
            overflow: hidden;
            object-position: center;
        }

        .attr-content-desc-text {
            font-size : 10px;
            color: #8f8e91;
        }

        .attr-content-type-text {
            font-size : 14px;
            color : #5683b1;
        }

        .attr-content-name-text {
            font-size: 30px;
            font-weight: bolder;
        }

        .attr-table {
            width : 200px;
            font-weight: bold;
            padding : 20px;
        }

        .attr-review-text {
            font-size : 50px;
            font-weight: bolder;
        }

        .review-title {
            font-size : 30px;
            font-weight: bold;
            color: #5682b2;
        }
        .review-content {
            font-size : 18px;
            height: 200px;
        }
        .review-date, .user-id {
            font-size : 12px;
            color: #b0afb2;
        }

        #map {
            height: 100%;
        }
        .mapContainer {
            height: 300px;
        }
    </style>

    <script
            src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCijcJxKaBv72OlNvM6yYO10UP47Ago11Y&callback=initMap&libraries=places&region=kr" defer
    ></script>
    <script>
        function reviewSubmit() {
            var $subject = $('#reviewSubject');
            var $content = $('#reviewContent');

            if ($subject.val() === '' || $content.val() === '') {
                return false;
            }
        }

        let infowindow;
        let map;
        let service;

        function initMap() {
            var place = new google.maps.LatLng(${attr_bean.attr_latitude}, ${attr_bean.attr_longitude});
            infowindow = new google.maps.InfoWindow();
            map = new google.maps.Map(document.getElementById('map'), {
                center: place,
                zoom: 16,
                disableDefaultUI : true
            });

            new google.maps.Marker({
                map : map,
                position : place
            })
            service = new google.maps.places.PlacesService(map);

            var request = {
                location : place,
                radius : '1000',
                type : ['parking', 'restaurant']
            };

            service.nearbySearch(request, callback);
        }

        function callback(results, status) {
            if (status == google.maps.places.PlacesServiceStatus.OK) {
                for (var i = 0; i < results.length; i++) {
                    createMarker(results[i]);
                }
            }
        }

        function createMarker(place) {
            const marker = new google.maps.Marker({
                map,
                position: place.geometry.location,
            });
            google.maps.event.addListener(marker, "click", () => {
                infowindow.setContent(place.name);
                infowindow.open(map);
            });
        }

    </script>
    
</head>
<body>
    <jsp:include page="../navbar.jsp"/>
    <section class="page-section" style="margin-top: 100px">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col">
                    <p class="text-center attr-content-type-text">${attr_bean.attr_type}</p>
                    <p class="text-center attr-content-name-text">${attr_bean.attr_name}</p>
                    <br>
                    <hr>
                    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                        <ol class="carousel-indicators">
                            <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                            <li data-target="#carouselExampleIndicators" data-slide-to="3"></li>

                        </ol>
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img class="img-fluid attr-content-img" src="${imgList[0]}" data-src="" alt="First slide">
                            </div>
                            <div class="carousel-item">
                                <img class="img-fluid attr-content-img" src="${imgList[1]}" data-src="" alt="Second slide">
                            </div>
                            <div class="carousel-item">
                                <img class="img-fluid attr-content-img" src="${imgList[2]}" data-src="" alt="Third slide">
                            </div>
                            <div class="carousel-item">
                                <img class="img-fluid attr-content-img" src="${imgList[3]}" data-src="" alt="Fourth slide">
                            </div>
                        </div>
                        <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                    </div> <!-- carousel end -->
                    <br>
                    <p class="attr-content-desc-text text-center">${attr_bean.attr_desc}</p>

                    <table>
                        <tr>
                            <td class="attr-table">전화번호</td>
                            <td>${attr_bean.attr_phone}</td>
                        </tr>
                        <tr>
                            <td class="attr-table">웹사이트</td>
                            <td>${attr_bean.attr_website}</td>
                        </tr>
                        <tr>
                            <td class="attr-table">이용시간</td>
                            <td>${attr_bean.attr_time}</td>
                        </tr>
                        <tr>
                            <td class="attr-table">휴무일</td>
                            <td>${attr_bean.attr_closed}</td>
                        </tr>
                        <tr>
                            <td class="attr-table">운영요일</td>
                            <td>${attr_bean.attr_openday}</td>
                        </tr>
                        <tr>
                            <td class="attr-table">이용요금</td>
                            <td>${attr_bean.attr_price}</td>
                        </tr>
                    </table>

                    <hr>

                    <div class="mapContainer">
                        <div id="map">
                            <!-- google map -->
                        </div>

                    </div>

                    <table>
                        <tr>
                            <td class="attr-table">주소</td>
                            <td>${attr_bean.attr_addr}</td>
                        </tr>
                        <tr>
                            <td class="attr-table">교통정보</td>
                            <td>${attr_bean.attr_traffic}</td>
                        </tr>
                    </table>
                    <br>
                    <form action="AttractionSubmitReview.attr" method="post" id="reviewForm" onsubmit="return reviewSubmit()">

                        <p class="attr-review-text">리뷰 <button type="submit" class="btn btn-primary" id="reviewSubmitBtn">리뷰작성</button>
                        </p>

                        <div class="form-group">
                            <input type="text" class="form-control" placeholder="타이틀" id="reviewSubject" name="reviewSubject">
                        </div>
                        <div class="form-group">
                            <textarea class="form-control" style="resize : none" placeholder="리뷰" id="reviewContent" name="reviewContent"></textarea>
                        </div>
                        <input type="hidden" value="${attr_bean.attr_no}" name="attr_no">
                    </form>

                    <div class="card-columns">
                        <% int reviewCount = (int)request.getAttribute("reviewCount"); %>
                        <% List<AttractionReviewBean> reviewList = (ArrayList<AttractionReviewBean>)request.getAttribute("reviewList"); %>
                        <% for(int i = 0; i < reviewCount; i++) { %>
                            <div class="card">
                                <div class="card-body">
                                    <div class="review-title">
                                        <%= reviewList.get(i).getReview_subject()%>
                                    </div>
                                    <div class="review-content">
                                        <%= reviewList.get(i).getReview_content()%>
                                    </div>
                                    <div class="review-date">
                                        <%= reviewList.get(i).getReview_date()%>
                                    </div>
                                    <div class="user-id">
                                        <%= reviewList.get(i).getUser_id()%>
                                    </div>

                                </div>
                            </div>
                        <% }%>
                    </div>

                    <br>
                    <form action="AttractionReserve.attr" method="post">
                        <button class="btn btn-secondary align-self-center">예약하기</button>
                        <input type="hidden" value="${attr_bean.attr_name}" name="attr_name">
                    </form>


               </div> <!-- col end -->

            </div>

        </div>
    </section>

<jsp:include page="../footer.jsp"/>

</body>
</html>
