<%--
  Created by IntelliJ IDEA.
  User: jinsy
  Date: 2020-12-13
  Time: 오후 9:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../source.jsp"/>

    <script>
        function findFormCheck() {
            var id = $('#findID').val();
            var hint = $('#findHint').val();

            if(id === '' || hint === '') {
                alert("정보를 모두 입력해주세요");
                return false;
            }
        }

    </script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col">
                <p><h5>비밀번호 찾기</h5></p>
                <hr class="custom-hr">
            </div>
        </div>
        <div class="row justify-content-center align-content-center align-content-center align-self-center">
            <div class="col">
                <form action="ForgotPasswordAction.do" method="post" onsubmit="return findFormCheck()">
                    <div class="form-group">
                        <label for="findID">아이디</label>
                        <input id="findID" class="form-control" type="text" placeholder="ID" name="id" style="width: 200px">
                    </div>

                    <div class="form-group">
                        <label for="findID">이메일</label>
                        <input id="findEmail" class="form-control" type="text" placeholder="Email" name="email" style="width: 200px">
                    </div>

                    <div class="form-group">
                        <label for="findHint">힌트</label>
                        <input id="findHint" class="form-control" type="text" placeholder="Hint" name="hint" style="width: 200px">
                    </div>

                    <button class="btn btn-secondary">제출</button>
                </form>
            </div>
        </div>
    </div>


</body>
</html>

