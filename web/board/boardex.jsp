<%@ page import="jsp.attraction.model.AttractionReviewBean" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="jsp.board.model.CommentBean" %>
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


    </style>

    <script>
        $(function () {

            <c:if test="${sessionScope.sessionID != null}" var="loginCheck"></c:if>

            $('#commentSubmit').click( function() {
                var check = '<c:out value="${loginCheck}"/>';
                if( check == 'false') {
                    alert("로그인 후 이용 가능합니다.");
                    return false;
                }
                var sendData = {
                    comment_id : '${sessionScope.sessionID}',
                    content : $('#commentInput').val(),
                    board_num : ${board_content.board_num}
                };

                $.ajax( {
                    url : "BoardWriteCommentAction.board",
                    data : sendData,
                    dataType : "text",

                    success : function(data) {
                        if(data.trim() == 'failed') {
                            alert("등록 실패");
                        }
                        else if(data.trim() == 'success') {
                            location.reload();
                        }
                    }
                });
            });

            $('#listBtn').click(function() {
                history.back();
            });

            $('#deleteBtn').click(function() {
                var url = "BoardDeleteAction.board?board_num=" + ${board_content.board_num};
                location.href = url;
            });

            $('#modifyBtn').click(function() {
                var url = "BoardModifyForm.board?board_num=" + ${board_content.board_num};
                location.href = url;
            })
        })
    </script>

    <jsp:useBean id="board_content" class="jsp.board.model.BoardBean" scope="session"/>

</head>
<body>
<jsp:include page="../navbar.jsp"/>
<section class="page-section" style="margin-top: 100px">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col">
                <p class="text-center attr-content-type-text">${board_content.board_date}</p>
                <p class="text-center attr-content-name-text">${board_content.board_subject}</p>
                <%
                    String owner_id = board_content.getBoard_owner_id();
                    String user_id = (String)session.getAttribute("sessionID");

                    if(owner_id.equals(user_id)) {
                        out.print(" <a href=\"#\" id=\"deleteBtn\" class=\"mx-1\"><i class=\"far fa-trash-alt\" style=\"width:12px; height: 12px; color: #0b2e13\"></i></a> ");
                        out.print(" <a href=\"#\" id=\"modifyBtn\" class=\"mx-1\"><i class=\"far fa-edit\" style=\"width:12px; height: 12px; color: #0b2e13\"></i></a>\n");
                    }
                %>
                <p class="text-center attr-content-type-text">${board_content.board_owner_id}</p>

                <hr>
                <p class="text-center attr-content-type-text">댓글</p>
                <button id="listBtn" class="btn-sm btn-secondary" style="margin-left : 220px"><span style="font-size: 10px;">목록</span></button>

                <!-- Comment -->
                <%
                    ArrayList<CommentBean> comment = board_content.getCommentList();

                    if(comment != null) {
                        for(CommentBean bean : comment) {
                            out.print("<div><hr></div>");
                            out.print("<div class='row'>");
                            out.print("<div class='col-lg-2 text-center' style='font-size : 10pt'>" + bean.getUser_id() + "</div>");
                            out.print("<div class='col-lg-8'>" + bean.getContent() + "</div>");
                            out.print("<div class='col-lg-2' style='font-size : 8pt'>" + bean.getWrite_date() + "</div>");
                            out.print("</div>");
                        }
                    }
                %>

                <textarea class="form-control" id="commentInput" style="height: 100px; width: 500px; resize:none" placeholder="댓글 입력"></textarea>
                <button class="btn btn-dark" type="button" id="commentSubmit"><p style="font-size: 10pt">등록</p></button>

                <br>

                <hr>

            </div> <!-- col end -->

        </div>

    </div>
</section>

<jsp:include page="../footer.jsp"/>

</body>
</html>
