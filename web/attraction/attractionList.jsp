<%--
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

    </style>
</head>
<body>
    <jsp:include page="../navbar.jsp"/>

    <section class="page-section">
        <header style="background-image : url('${pageContext.request.contextPath}/assets/img/북촌한옥마을3.jpeg'); background-size : cover; background-repeat: no-repeat; background-position: top">
            <div style="width: 800px; height: 400px"></div>
            <div class="font-weight-bold display-4 text-white" style="padding : 100px">명소</div>
        </header>

        <div class="container">

            <div class="card-group">
                <div class="col-md-4 col-lg-4 col-sm-4">
                    <div class="card" style="margin-top: 100px">
                        <img class="card-img-top attr-card-img" src="/TravelGuide/assets/img/경복궁1.webp" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">경복궁</h4>
                            <p class="card-text attr-card-text">
                                경복궁은 대한민국 서울 세종로에 있는 대조선국 왕조의 법궁이다. 근정전을 중심으로 하고 있다. 1395년에 창건하였다.
                                ‘경복’은 시경에 나오는 말로 왕과 그 자손, 온 백성들이 태평성대의 큰 복을 누리기를 축원한다는 의미다.
                            </p>
                            <a href="AttractionContent.attr?attr_no=1" class="btn btn-secondary attr-card-btn-text mr-5">상세보기</a>
                            <span class="attr-card-price">&#8361;35,000</span>
                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-lg-4 col-sm-4">

                    <div class="card" style="margin-top: 100px">
                        <img class="card-img-top attr-card-img" src="/TravelGuide/assets/img/북촌.jpeg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">북촌 한옥마을</h4>
                            <p class="card-text attr-card-text">
                                북촌 한옥마을은 서울특별시 종로구의 가회동과 삼청동 내에 위치한 한옥마을이다. 지리상으로 경복궁과 창덕궁, 종묘의 사이에 자리잡고 있다.
                            </p>
                            <a href="AttractionContent.attr?attr_no=3" class="btn btn-secondary attr-card-btn-text mr-5 ">상세보기</a>
                            <span class="attr-card-price">&#8361;40,000</span>

                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-lg-4 col-sm-4">

                    <div class="card" style="margin-top: 100px">
                        <img class="card-img-top attr-card-img" src="/TravelGuide/assets/img/수원화성2.jpeg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">수원화성</h4>
                            <p class="card-text attr-card-text">
                                수원화성은 조선왕조 제22대 정조대왕이 세자에 책봉되었으나 당쟁에 휘말려 왕위에 오르지 못하고 뒤주 속에서 생을 마감한 아버지 사도세자의 능침을 양주 배봉산에서
                                조선 최대의 명당인 수원 화산으로 천봉하고 화산 부근에 있던 읍치를 수원 팔달산 아래 지금의 위치로 옮기면서 축성되었습니다.
                            </p>
                            <a href="AttractionContent.attr?attr_no=2" class="btn btn-secondary attr-card-btn-text mr-5">상세보기</a>
                            <span class="attr-card-price">&#8361;25,000</span>

                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-lg-4 col-sm-4">

                    <div class="card" style="margin-top: 100px">
                        <img class="card-img-top attr-card-img" src="/TravelGuide/assets/img/창덕궁2.jpg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">창덕궁</h4>
                            <p class="card-text attr-card-text">
                                창덕궁은 대한민국 서울특별시의 북악산 왼쪽 봉우리인 응봉자락에 자리 잡고 있는 조선 시대 궁궐로 동쪽으로 창경궁과 맞닿아 있다. 경복궁의 동쪽에 있어서 조선 시대에는 창경궁과 더불어 동궐이라 불렀다.
                            </p>
                            <a href="AttractionContent.attr?attr_no=4" class="btn btn-secondary attr-card-btn-text mr-5">상세보기</a>
                            <span class="attr-card-price">&#8361;31,000</span>

                        </div>
                    </div>
                </div>

                <div class="col-md-4 col-lg-4 col-sm-4">

                    <div class="card" style="margin-top: 100px">
                        <img class="card-img-top attr-card-img" src="/TravelGuide/assets/img/성산1.jpeg" alt="Card image cap">
                        <div class="card-body">
                            <h4 class="card-title">성산일출봉</h4>
                            <p class="card-text attr-card-text">
                                성산일출봉 천연보호구역은 제주특별자치도 서귀포시 성산읍 성산리에 있는 산이다.
                                커다란 사발 모양의 분화구가 특징으로, 분화구 내부의 면적은 129,774m²이다. 높이는 182 m이다.
                                성산 일출봉에서의 일출은 대한민국에서 가장 아름다운 해돋이로 꼽히며 영주십경 중 하나이다.
                            </p>
                            <a href="AttractionContent.attr?attr_no=5" class="btn btn-secondary attr-card-btn-text mr-5">상세보기</a>
                            <span class="attr-card-price">&#8361;29,000</span>

                        </div>
                    </div>
                </div>


            </div>
        </div>

    </section>


    <jsp:include page="../footer.jsp"/>
</body>
</html>
