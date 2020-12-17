
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <jsp:include page="../source.jsp"/>

    <script>
        function formLengthCheck() {
            var subject = $('#formGroupInputSubject');
            var content = $('#formGroupInputContent');

            if(subject.val().length > 200 || content.val().length > 2000) {
                alert("문자열 길이 초과");
                return false;
            }
        }
    </script>
</head>
<body>


<jsp:include page="../navbar.jsp"/>
<section class="page-section" style="margin-top : 100px">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-10">
                <form action="BoardModifyAction.board?board_num=${boardbean.board_num}" method="post" onsubmit="return formLengthCheck()">
                    <div class="form-group">
                        <input type="text" id="formGroupInputSubject" name="modify_board_subject" class="form-control" placeholder="제목" value="${boardbean.board_subject}">
                    </div>

                    <div class="form-group">
                        <textarea id="formGroupInputContent" name="modify_board_content" class="form-control" placeholder="내용" style="resize: none; height: 500px">${boardbean.board_content}</textarea>
                    </div>

                    <div class="form-group align-content-end">
                        <button type="submit" class="btn btn-secondary"><i class="fas fa-pen"></i>submit</button>
                    </div>
                    <input type="hidden" value="${boardbean.board_num}" name="modify_board_no">
                </form>
            </div>
        </div>
    </div>
</section>

<jsp:include page="../footer.jsp"/>

</body>
</html>

