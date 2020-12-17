<%--<%@ page import="jsp.board.model.BoardBean" %>--%>
<%--<%@ page import="jsp.board.model.CommentBean" %>--%>
<%--<%@ page import="java.util.ArrayList" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>--%>

<%--<jsp:useBean id="board_content" class="jsp.board.model.BoardBean" scope="session"/>--%>

<%--<html>--%>
<%--<head>--%>
<%--    <title>Travel Guide :: ${board_content.board_subject}</title>--%>

<%--    <jsp:include page="/source.jsp"/>--%>

<%--    <script>--%>
<%--        $(function () {--%>

<%--            <c:if test="${sessionScope.sessionID != null}" var="loginCheck"></c:if>--%>

<%--            $('#commentSubmit').click( function() {--%>
<%--                var check = '<c:out value="${loginCheck}"/>';--%>
<%--                if( check == 'false') {--%>
<%--                    alert("로그인 후 이용 가능합니다.");--%>
<%--                    return false;--%>
<%--                }--%>
<%--                var sendData = {--%>
<%--                    comment_id : '${sessionScope.sessionID}',--%>
<%--                    content : $('#commentInput').val(),--%>
<%--                    board_num : ${board_content.board_num}--%>
<%--                };--%>

<%--                $.ajax( {--%>
<%--                    url : "BoardWriteCommentAction.board",--%>
<%--                    data : sendData,--%>
<%--                    dataType : "text",--%>

<%--                    success : function(data) {--%>
<%--                        if(data.trim() == 'failed') {--%>
<%--                            alert("등록 실패");--%>
<%--                        }--%>
<%--                        else if(data.trim() == 'success') {--%>
<%--                            location.reload();--%>
<%--                        }--%>
<%--                    }--%>
<%--                });--%>
<%--            });--%>

<%--            $('#listBtn').click(function() {--%>
<%--                history.back();--%>
<%--            });--%>

<%--            $('#deleteBtn').click(function() {--%>
<%--                var url = "BoardDeleteAction.board?board_num=" + ${board_content.board_num};--%>
<%--                location.href = url;--%>
<%--            });--%>

<%--            $('#modifyBtn').click(function() {--%>
<%--                var url = "BoardModifyForm.board?board_num=" + ${board_content.board_num};--%>
<%--                location.href = url;--%>
<%--            })--%>
<%--        })--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>

<%--    <jsp:include page="/navbar.jsp"/>--%>

<%--    <section class="page-section">--%>

<%--        <div class="container">--%>

<%--            <!-- Subject -->--%>
<%--            <div class="row justify-content-center">--%>
<%--                <div class="col-lg-10">--%>
<%--                    <p class="font-weight-bold"><h4>${board_content.board_subject}</h4></p>--%>
<%--                </div>--%>
<%--                <div class="col-lg-2 pt-4">--%>
<%--                    <%--%>
<%--                      String owner_id = board_content.getBoard_owner_id();--%>
<%--                      String user_id = (String)session.getAttribute("sessionID");--%>

<%--                      if(owner_id.equals(user_id)) {--%>
<%--                          out.print(" <a href=\"#\" id=\"deleteBtn\" class=\"mx-1\"><i class=\"far fa-trash-alt\" style=\"width:12px; height: 12px; color: #0b2e13\"></i></a> ");--%>
<%--                          out.print(" <a href=\"#\" id=\"modifyBtn\" class=\"mx-1\"><i class=\"far fa-edit\" style=\"width:12px; height: 12px; color: #0b2e13\"></i></a>\n");--%>
<%--                      }--%>
<%--                    %>--%>
<%--                </div>--%>

<%--            </div>--%>
<%--            <div class="row justify-content-between mx-2" style= "font-size : 8pt">--%>
<%--                <div>작성자 : ${board_content.board_owner_id}</div>--%>
<%--                <div></div>--%>
<%--                <div>작성일 : ${board_content.board_date}</div>--%>
<%--            </div>--%>
<%--            <div><hr></div>--%>
<%--            <!-- Content -->--%>
<%--            <p class="ml-3">${board_content.board_content}</p>--%>
<%--            <div><hr></div>--%>
<%--            <div class="row ml-2" style="font-size: 10px;">--%>
<%--                <div class="col">댓글</div>--%>
<%--                <div class="col">--%>

<%--                    <button id="listBtn" class="btn-sm btn-secondary" style="margin-left : 220px"><span style="font-size: 10px;">목록</span></button>--%>

<%--                </div>--%>
<%--            </div>--%>


<%--            <!-- Comment -->--%>
<%--                <%--%>
<%--                    ArrayList<CommentBean> comment = board_content.getCommentList();--%>

<%--                    if(comment != null) {--%>
<%--                        for(CommentBean bean : comment) {--%>
<%--                            out.print("<div><hr></div>");--%>
<%--                            out.print("<div class='row'>");--%>
<%--                            out.print("<div class='col-lg-2 text-center' style='font-size : 10pt'>" + bean.getUser_id() + "</div>");--%>
<%--                            out.print("<div class='col-lg-8'>" + bean.getContent() + "</div>");--%>
<%--                            out.print("<div class='col-lg-2' style='font-size : 8pt'>" + bean.getWrite_date() + "</div>");--%>
<%--                            out.print("</div>");--%>
<%--                        }--%>
<%--                    }--%>
<%--                %>--%>

<%--            <div class="row my-3">--%>
<%--                <div class="col-lg-10">--%>
<%--                    <textarea class="form-control" id="commentInput" style="height: 100px; resize:none" placeholder="댓글 입력"></textarea>--%>
<%--                </div>--%>
<%--                <div class="col-lg-2">--%>
<%--                    <button class="btn btn-dark" type="button" id="commentSubmit"><p style="font-size: 10pt">등록</p></button>--%>
<%--                </div>--%>
<%--            </div>--%>

<%--        </div>--%>

<%--    </section>--%>

<%--    <jsp:include page="/footer.jsp"/>--%>

<%--</body>--%>
<%--</html>--%>


<%@ page import="jsp.attraction.model.AttractionReviewBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jsp.board.model.CommentBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
        /*텍스트 줄바꿈 처리*/
        .content-text {
            white-space: pre-wrap;
            word-break: break-all;
        }


    </style>

    <script>
        $(function () {

            var navsize = $('#mainNav').height()+50;
            var location = $('#boardContentContainer').offset().top-navsize;
            console.log(location);
            window.scrollTo({top:location, behavior : 'smooth'});

            <c:if test="${sessionScope.sessionID != null}" var="loginCheck"></c:if>

            $('#commentSubmit').click( function() {
                var check = '<c:out value="${loginCheck}"/>';
                if( check == 'false') {
                    alert("로그인 후 이용 가능합니다.");
                    return false;
                }
            });

            $('#listBtn').click(function() {
                history.back();
            });



        });
        function formLengthCheck() {
            var content = $('#commentInput');

            if(content.val().length > 1000) {
                alert("문자열 길이 초과");
                return false;
            }
        }

        function deleteBtn(event) {
            event.preventDefault();
            var url = "BoardDeleteAction.board?board_num=" + ${board_content.board_num};
            location.href = url;
        }

        function modifyBtn(event) {
            event.preventDefault();
            var url = "BoardModifyForm.board?board_num=" + ${board_content.board_num};
            location.href = url;
        }
    </script>

    <jsp:useBean id="board_content" class="jsp.board.model.BoardBean" scope="session"/>

</head>
<body>
<jsp:include page="../navbar.jsp"/>
<section class="page-section">
    <header style="background-image : url('${pageContext.request.contextPath}/assets/img/창경궁4.jpeg'); background-size : cover; background-repeat: no-repeat; background-position: bottom">
        <div style="width: 800px; height: 400px"></div>
        <div class="font-weight-bold display-4 text-white" style="padding : 100px">여행 후기/여행지 추천</div>
    </header>
    <div id="boardContentContainer"class="container mt-5" style="max-width: 1080px">
        <div class="row justify-content-center">
            <div class="col">
                <p class="text-center attr-content-type-text">${board_content.board_date}</p>
                <p class="text-center attr-content-name-text">${board_content.board_subject}</p>
                <p class="text-center attr-content-type-text">${board_content.board_owner_id}</p>

                <div class="row justify-content-center">
                <%
                    String owner_id = board_content.getBoard_owner_id();
                    String user_id = (String)session.getAttribute("sessionID");

                    if(owner_id.equals(user_id)) {
                        out.print(" <a href=\"\" onclick=\"return deleteBtn(event)\" id=\"deleteBtn\" class=\"mx-1\"><i class=\"far fa-trash-alt\" style=\"width:12px; height: 12px; color: #0b2e13\"></i></a> ");
                        out.print(" <a href=\"\" onclick=\"return modifyBtn(event)\"id=\"modifyBtn\" class=\"mx-1\"><i class=\"far fa-edit\" style=\"width:12px; height: 12px; color: #0b2e13\"></i></a>\n");
                    }
                %>
                </div>

                <hr>
                <p class="content-text"style="min-height: 400px">${board_content.board_content}</p>

                <div class="d-flex flex-row justify-content-between mt-3">
                    <span class="text-left attr-content-type-text align-self-end" style="margin-left : 20px;">댓글</span>
                    <button id="listBtn" class="btn btn-secondary align-self-end" style="float:right; margin-right : 20px;">목록</button>

                </div>

                <hr>
                <!-- Comment -->
                <%
                    ArrayList<CommentBean> comment = board_content.getCommentList();

                    if(comment != null) {
                        for(CommentBean bean : comment) {
                            out.print("<div class='row my-4'>");
                            out.print("<div class='col-lg-2 text-center' style='font-size : 10pt'>" + bean.getUser_id() + "</div>");
                            out.print("<div class='col-lg-8 content-text'>" + bean.getContent() + "</div>");
                            out.print("<div class='col-lg-2' style='font-size : 8pt'>" + bean.getWrite_date() + "</div>");
                            out.print("</div>");
                            out.print("<div><hr></div>");

                        }
                    }
                %>

                <form action="BoardWriteCommentAction.board" method="post" onsubmit="return formLengthCheck()">
                    <div class="d-flex flex-row justify-content-between mt-3">
                        <textarea class="form-control" name="content" id="commentInput" style="width : 80%; height: 100px; margin-left: 20px; resize:none" placeholder="댓글 입력"></textarea>
                        <button class="btn btn-dark align-self-center"type="submit" id="commentSubmit" style="float : right; height : 100px; margin-right:20px">등록</button>
                        <input type="hidden" value="${board_content.board_num}" name="board_num">
                    </div>
                </form>


            </div> <!-- col end -->

        </div>

    </div>
</section>

<jsp:include page="../footer.jsp"/>

</body>
</html>

