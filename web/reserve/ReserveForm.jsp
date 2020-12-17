<%@ page import="java.util.ArrayList" %>
<%@ page import="jsp.reserve.model.TravelInfoBean" %>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Travel Guide :: Reservation</title>

        <jsp:include page="/source.jsp" />

        <style>
            /* Always set the map height explicitly to define the size of the div
             * element that contains the map. */
            #map {
                height: 100%;
            }

            .container-info {
                padding : 1.0rem
            }

            .container-info span{
                font-size: 10px;
                color: #98979a;
                margin-right : 0.5rem
            }

            .dropdown-dest {
                max-height: 300px;
                width : 300px;
            }

        </style>

        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
        <script
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCijcJxKaBv72OlNvM6yYO10UP47Ago11Y&callback=initMap&libraries=places&region=kr" defer
        ></script>
        <script src="https://unpkg.com/@googlemaps/markerclustererplus/dist/index.min.js"></script>


        <!-- Bootstrap-DatePicker(TempusDominus) 다른 소스들 보다 나중에 링크되어야 작동-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/css/tempusdominus-bootstrap-4.min.css" integrity="sha512-PMjWzHVtwxdq7m7GIxBot5vdxUY+5aKP9wpKtvnNBZrVv1srI8tU6xvFMzG8crLNcMj/8Xl/WWmo/oAP/40p1g==" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js" integrity="sha512-LGXaggshOkD/at6PFNcp2V2unf9LzFq6LE+sChH7ceMTDP0g2kn6Vxwgg7wkPP7AAtX+lmPqPdxB47A0Nz0cMQ==" crossorigin="anonymous"></script>        <script src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.7/js/tether.min.js" integrity="sha512-X7kCKQJMwapt5FCOl2+ilyuHJp+6ISxFTVrx+nkrhgplZozodT9taV2GuGHxBgKKpOJZ4je77OuPooJg9FJLvw==" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.1.2/js/tempusdominus-bootstrap-4.min.js" integrity="sha512-2JBCbWoMJPH+Uj7Wq5OLub8E5edWHlTM4ar/YJkZh3plwB2INhhOC3eDoqHm1Za/ZOSksrLlURLoyXVdfQXqwg==" crossorigin="anonymous"></script>

        <script>
            $(function (){

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


                $('.dropdown-item').click( function() {
                    var item = { dest : $(this).text() };
                    $('#destList').text($(this).text());
                    $.ajax( {
                        url : "ReserveGetCourseListAction.rsrv",
                        async : true,
                        type : "GET",
                        data : item,
                        dataType : "json",

                        success : function(data) {
                            $('#courseList').empty();
                            for(var i in data) {
                                var $item = $('<div class="form-check">\n' +
                                    '  <input class="form-check-input" name="box" type="checkbox" value="" id="' + data[i] + 'Check">\n' +
                                    '  <label class="form-check-label" for="' + data[i] + 'Check">\n' +
                                    data[i] +
                                    '  </label>\n' +
                                    '</div>');
                                $('#courseList').append($item);
                            }

                        }
                    })
                }) // Dropdown Item Event Listener End

                function loginCheck() {
                    return new Promise(((resolve, reject) => {
                        $.ajax({
                            url: "LoginCheckAction.do",
                            type: "get",
                            dataType: "text",

                            success: function (result) {
                                if (result.trim() === 'false') {
                                    alert("로그인 후 이용 가능합니다.");
                                    reject();
                                } else { resolve();}
                            }
                        });
                    }))
                }

                function formCheck() {
                    return new Promise(((resolve, reject) => {
                        var list = [];
                        $('input[name=box]:checked').each(function() {
                            list.push( $(this).siblings(':eq(0)').text().trim());
                        })
                        var submitData = {
                            startDate : $('#startDate').val(),
                            endDate : $('#endDate').val(),
                            destination : $('#destList').text(),
                            course : list
                        }
                        if(submitData.startDate == "" || submitData.endDate == "" || submitData.destination == "") {
                            alert("정보를 모두 입력해주세요");
                            reject();
                        } else { resolve(submitData);}

                    }))
                }

                function submitReservation(submitData) {
                    return new Promise(((resolve, reject) => {
                        $.ajax({
                            url : "ReserveSubmitAction.rsrv",
                            data : submitData,
                            traditional : true,
                            async : true,
                            dataType : "text",

                            success : function(data) {
                                if(data.trim() == "success") {
                                    alert("등록 완료");
                                    location.reload();
                                    resolve();
                                } else {
                                    alert("등록 실패");
                                    reject();
                                }
                            }
                        });

                    }))
                }


                $('#reserveSubmit').click( function() {
                    loginCheck()
                    .then(formCheck)
                    .then(submitReservation);
                });


                $('#reserveList').click(function () {
                    loginCheck()
                    .then(() => {location.href = "ReserveShowListAction.rsrv?page=1";});
                }); // ReserveList


            }); // document ready part end

            let map;
            let service;
            var markers = [];
            var _data;
            var content = [];


            function initMap() {
                var seoul = new google.maps.LatLng(36.2642135, 128.0016985);

                map = new google.maps.Map(document.getElementById('map'), {
                    center: seoul,
                    zoom: 7,
                    disableDefaultUI : true
                });

                setMap();

            }



            function setMap() {
                service = new google.maps.places.PlacesService(map);
                $.ajax({
                    url : "ReserveGetTravelDestAction.rsrv",
                    type : "get",
                    contentType : "application/json; charset=utf-8",

                    success : function(data) {

                        _data = data;
                        var infowindow = new google.maps.InfoWindow();

                        for(var i in data) {

                            var marker = new google.maps.Marker({
                                map : map,
                                position : new google.maps.LatLng(data[i].tdLatitude, data[i].tdLongitude),
                                label : {
                                    text : data[i].tdName
                                }
                            });

                            _data[i].tdCnvFclty = (_data.tdCnvFclty != null && _data.tdCnvFclty != 'null') ? _data[i].tdCnvFclty : '';
                            _data[i].tdStayInfo = (_data.tdStayInfo != null && _data.tdStayInfo != 'null') ? _data[i].tdStayInfo : '';
                            _data[i].tdExFclty = (_data.tdExFclty != null && _data.tdExFclty != 'null') ? _data[i].tdExFclty : '';
                            _data[i].tdRcrFclty  = (_data.tdRcrFclty  != null && _data.tdRcrFclty  != 'null') ? _data[i].tdRcrFclty : '';
                            _data[i].tdsuprtFclty = (_data.tdsuprtFclty != null && _data.tdsuprtFclty != 'null') ? _data[i].tdsuprtFclty : '';


                            google.maps.event.addListener(marker, 'click', (function(marker, i) {
                                return function() {
                                    // row 안에 col 넣어줘야 제대로 작동
                                    var content =
                                        `<div class="container container-info">
                                            <div class="row">
                                                <div class="col">
                                                <h2 id="destName">\${_data[i].tdName}</h2>
                                                <hr>
                                                <p>\${_data[i].tdDescription}</p>
                                                <p><span>주소</span>\${_data[i].tdRAddr}</p>
                                                <p><span>편의시설</span>\${_data[i].tdCnvFclty}</p>
                                                <p><span>숙박시설</span>\${_data[i].tdStayInfo}</p>
                                                <p><span>운동시설</span>\${_data[i].tdExFclty}</p>
                                                <p><span>문화.여가시설</span>\${_data[i].tdRcrFclty}</p>
                                                <p><span>지원시설</span>\${_data[i].tdsuprtFclty}</p>
                                                <button class="btn btn-secondary" onclick="return selectDest()">선택</button>

                                                </div>

                                            </div>
                                        </div>`;
                                    infowindow.setContent(content);
                                    infowindow.open(map, marker);
                                }
                            })(marker, i));

                            markers[i] = marker;


                        }

                        //마커 클러스터링
                        new MarkerClusterer(map, markers, {
                            imagePath:
                                "https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/m",
                        });
                    },
                    complete : function() {
                        console.log("complete");
                    },
                    error : function(err) {
                        console.log(err);
                        console.log("error");
                    }
                });
            }

            function selectDest() {
                var selected = $('#destName').text();
                $('#destList').text(selected);
            }
        </script>

    </head>
<body>

    <!-- navbar section -->
    <jsp:include page="/navbar.jsp" />


    <!-- Reservation Form Section -->

    <section class="page-section">
        <hr>
        <div class="container">

            <div class="row">
                <div class="col">
                    <p><h5>예약</h5></p>
                    <hr class="custom-hr">
                </div>
            </div>

            <div class="row justify-content-center">

                <!-- Calendar -->
                <div class="col-md-4 col-lg-4 col-sm-4">
                    <div class="form-group">
                        <label for="datetimepicker7">출발일</label>
                        <div class="input-group date" id="datetimepicker7" data-target-input="nearest">
                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker7" id="startDate"/>
                            <div class="input-group-append" data-target="#datetimepicker7" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="datetimepicker8">도착일</label>
                        <div class="input-group date" id="datetimepicker8" data-target-input="nearest">
                            <input type="text" class="form-control datetimepicker-input" data-target="#datetimepicker8" id="endDate"/>
                            <div class="input-group-append" data-target="#datetimepicker8" data-toggle="datetimepicker">
                                <div class="input-group-text"><i class="far fa-calendar-alt"></i></div>
                            </div>
                        </div>
                    </div>

                    <div class="row" style="margin-bottom : 200px">
                        <div class="col-md-12 col-lg-12 col-sm-12">
                            <label for="destList">목적지</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <button id="destList" class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">${attr_name}</button>
                                    <% session.removeAttribute("attr_name"); %>
                                    <div class="dropdown-menu dropdown-dest">
                                        <%-- css 변경사항이 적용안될 땐 ctrl + F5로 브라우저 캐쉬 삭제 후 리로드--%>
<%--                                        <% ArrayList<TravelInfoBean> bean = (ArrayList<TravelInfoBean>)session.getAttribute("data"); %>--%>
<%--                                        <% for(TravelInfoBean item : bean) { %>--%>
<%--                                        <a class="dropdown-item" href="#" id="<%=item.getTdName()%>" ><%=item.getTdName()%></a>--%>
<%--                                        <% } %>--%>
                                    </div>
                                </div>
                            </div>
                        </div>

<%--                        <div class="col-md-6 col-lg-6 col-sm-6">--%>
<%--                            <label for="courseList">코스 목록</label>--%>
<%--                            <div id="courseList">--%>
<%--                                <!-- checkbox list added by js -->--%>
<%--                            </div>--%>
<%--                        </div>--%>

                    </div>

                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <button type="button" class="btn btn-secondary" id="reserveSubmit">제출</button>
                        </div>
                        <div class="col-lg-6 col-md-6 col-sm-6">
                            <button type="button" class="btn btn-secondary" id="reserveList">예약조회</button>
                        </div>

                    </div>




                </div>

                <div class="col-lg-8 col-md-8 col-sm-8 rounded">
                    <div id="map"></div>
                </div>

            </div>



        </div>
    </section>

    <!-- Footer Section -->
    <jsp:include page="/footer.jsp" />



</body>
</html>
