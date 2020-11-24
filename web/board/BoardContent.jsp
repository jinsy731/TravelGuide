<%@ page import="jsp.board.model.BoardBean" %>
<%@ page import="jsp.board.model.CommentBean" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<jsp:useBean id="board_content" class="jsp.board.model.BoardBean" scope="session"/>

<html>
<head>
    <title>Travel Guide :: ${board_content.board_subject}</title>

    <jsp:include page="/source.jsp"/>

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
            })
        })
    </script>
</head>
<body>

    <jsp:include page="/navbar.jsp"/>

    <section class="page-section mt-5">

        <div class="container d-flex flex-column shadow-sm" style="max-width : 720px">

            <!-- Subject -->
            <div class="row">
                <div class="col-lg-10">
                    <p class="font-weight-bold"><h4>${board_content.board_subject}</h4></p>
                </div>
                <div class="col-lg-2 pt-4">
                    <%
                      String owner_id = board_content.getBoard_owner_id();
                      String user_id = (String)session.getAttribute("sessionID");

                      if(owner_id.equals(user_id)) {
                          out.print(" <a href=\"\" class=\"mx-1\"><i class=\"far fa-trash-alt\" style=\"width:24px; height: 24px; color: #0b2e13\"></i></a> ");
                          out.print(" <a href=\"\" class=\"mx-1\"><i class=\"far fa-edit\" style=\"width:24px; height: 24px; color: #0b2e13\"></i></a>\n");
                      }
                    %>
                </div>

            </div>
            <div class="row justify-content-between mx-2" style= "font-size : 8pt">
                <div>작성자 : ${board_content.board_owner_id}</div>
                <div></div>
                <div>작성일 : ${board_content.board_date}</div>
            </div>
            <div><hr></div>
            <!-- Content -->
            <p class="ml-3">${board_content.board_content}</p>
            <div><hr></div>
            <div class="row ml-2" style="font-size: 12pt;">
                <div class="col">댓글</div>
                <div class="col">


                </div>
            </div>


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

            <div class="row my-3">
                <div class="col-lg-10">
                    <textarea class="form-control" id="commentInput" style="height: 100px; resize:none" placeholder="댓글 입력"></textarea>
                </div>
                <div class="col-lg-2">
                    <button class="btn btn-dark" type="button" id="commentSubmit"><p style="font-size: 10pt">등록</p></button>
                </div>
            </div>

        </div>

    </section>

    <jsp:include page="/footer.jsp"/>

</body>
</html>
