<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>
<html>
    <head>
        <title>Title</title>
        <jsp:include page="../source.jsp"/>
    </head>
    <body>
        <jsp:include page="../navbar.jsp"/>
        <section class="page-section" style="margin-top : 50px">
            <hr>
                <div class="container" style="max-width: 840px">
                    <div class="row">
                        <div class="col">
                            <h5>글 작성</h5>
                            <hr class="custom-hr">
                        </div>
                    </div>
                <div class="row justify-content-center">
                    <div class="col">
                        <form action="BoardWriteAction.board" method="post">
                            <div class="form-group">
                                <input type="text" id="formGroupInputSubject" name="board_subject" class="form-control" placeholder="제목">
                            </div>

                            <div class="form-group">
                                <textarea id="formGroupInputContent" name="board_content" class="form-control" placeholder="내용" style="resize: none; height: 500px"></textarea>
                            </div>

                            <div class="form-group align-content-end">
                                <button type="submit" class="btn btn-secondary"><i class="fas fa-pen"></i>submit</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

         <jsp:include page="../footer.jsp"/>
    </body>
</html>
