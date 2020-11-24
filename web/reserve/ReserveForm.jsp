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
        </style>

        <script src="https://polyfill.io/v3/polyfill.min.js?features=default"></script>
        <script
                src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCijcJxKaBv72OlNvM6yYO10UP47Ago11Y&callback=initMap&libraries=places&v=weekly&region=kr" defer
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

                <c:if test="${sessionScope.sessionID != null}" var="loginCheck"></c:if>

                $('#reserveSubmit').click( function() {
                    var check = '<c:out value="${loginCheck}"/>';
                    if( check == 'false') {
                        alert("로그인 후 이용 가능합니다.");
                        return false;
                    }
                    else {
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
                        if(submitData.startDate == "" || submitData.endDate == "" || submitData.destination == "" || submitData.course.length == 0) {
                            alert("정보를 모두 입력해주세요");
                            return false;
                        }

                        alert(submitData.startDate);

                        $.ajax( {
                            url : "ReserveSubmitAction.rsrv",
                            data : submitData,
                            traditional : true,
                            async : true,
                            dataType : "text",

                            success : function(data) {
                                if(data.trim() == "success")
                                    alert("등록 완료");
                                else
                                    alert("등록 실패");
                            }
                        });

                        location.reload();
                    }

                }); // Reserve Submit Event Handler END

                $('#reserveList').click(function () {
                    location.href = "ReserveShowListAction.rsrv";
                }); // ReserveList

                $('#ajaxload').click( function() {
                    $.ajax({
                        url : "ReserveGetTravelDestAction.rsrv",
                        type : "get",
                        contentType : "application/json; charset=utf-8",
                        async : true,

                        success : function(data) {
                            const markers = [];
                            for(var i in data) {
                                if(i%2 == 0) continue;
                                const icons = {
                                    custom: {
                                        url: "http://localhost:8080/TravelGuide/assets/img/custom_marker.png",
                                        scaledSize : new google.maps.Size(data[i].tdName.length*15,40),
                                        origin : new google.maps.Point(0,0),
                                        anchor : new google.maps.Point(0,0)
                                    }
                                };
                                const marker = new google.maps.Marker({
                                    map,
                                    position : new google.maps.LatLng(data[i].tdLatitude, data[i].tdLongitude),
                                    icon : icons.custom,
                                    label : {
                                        text : data[i].tdName,
                                        fontSize : "8px"
                                    }
                                });
                                markers[i] = marker;
                                marker.addListener("click", () => {
                                    map.setZoom(15);
                                    map.setCenter(marker.getPosition());
                                })
                            }

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
                });



            });
        </script>

        <%--구글 맵 스크립트--%>
        <script>
            let map;
            var service;
            var infowindow;

            function initMap() {
                var seoul = new google.maps.LatLng(37.5642135, 127.0016985);

                map = new google.maps.Map(document.getElementById('map'), {
                    center: seoul,
                    zoom: 15
                });

                var request = {
                    location: seoul,
                    radius: '500',
                    type: ['restaurant']
                };

                service = new google.maps.places.PlacesService(map);
                service.nearbySearch(request, callback);

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
                        label : {
                            text : place.name,
                            color : 'black',
                            fontSize : '8px'
                        }
                    });
                    google.maps.event.addListener(marker, "click", () => {
                        infowindow.setContent(place.name);
                        infowindow.open(map);
                    });
                }

               /* const icons = {
                    custom: {
                        url: "http://localhost:8080/TravelGuide/assets/img/custom_marker.png",
                        scaledSize : new google.maps.Size(100,30),
                        origin : new google.maps.Point(0,0),
                        anchor : new google.maps.Point(0,0)
                    }
                };

                map.addListener("click", (event) => {
                    addMarker(event.latLng, map);
                });

                function addMarker(location, map) {
                    // Add the marker at the clicked location, and add the next-available label
                    // from the array of alphabetical characters.
                    new google.maps.Marker({
                        position: location,
                        map: map,
                        icon : icons.custom,
                        label : '1dsadsadsadsadsadsadsadsadsadsads'
                    });
                }*/


            }



        </script>

    </head>
<body>

    <!-- navbar section -->
    <jsp:include page="/navbar.jsp" />


    <!-- Reservation Form Section -->

    <section class="page-section" style="margin-top: 100px">
        <div class="container">

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
                        <div class="col-md-6 col-lg-6 col-sm-6">
                            <label for="destList">목적지</label>
                            <div class="input-group">
                                <div class="input-group-prepend">
                                    <button id="destList" class="btn btn-outline-secondary dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Dropdown</button>
                                    <div class="dropdown-menu">
                                        <a class="dropdown-item" href="#">destA</a>
                                        <a class="dropdown-item" href="#">destB</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-6 col-lg-6 col-sm-6">
                            <label for="courseList">코스 목록</label>
                            <div id="courseList">
                                <!-- checkbox list added by js -->
                            </div>
                        </div>

                    </div>

                    <div class="row justify-content-center">
                        <button type="button" class="btn btn-primary m-5" id="reserveSubmit">제출</button>
                        <button type="button" class="btn btn-primary m-5" id="reserveList">예약조회</button>
                        <button id="ajaxload" class="btn btn-primary">button</button>

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
