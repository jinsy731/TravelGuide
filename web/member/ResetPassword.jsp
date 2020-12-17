<%--
  Created by IntelliJ IDEA.
  User: jinsy
  Date: 2020-12-13
  Time: 오후 10:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <jsp:include page="../source.jsp"/>

    <script>
        function resetPasswordFormSubmit() {
            var $pw = $('#newPW');
            var $pw2 = $('#newPWVerify');

            $('#enc_newPW').val(SHA256($pw.val()));
            $('#enc_newPW_verify').val(SHA256($pw2.val()));

            $pw.val('');
            $pw2.val('');
        }
    </script>
</head>
<body>
<section class="page-section">
    <div class="container">
        <div class="row">
            <div class="col">
                <p><h5>비밀번호 재설정</h5></p>
                <hr class="custom-hr">
            </div>
        </div>
        <div class="row justify-content-center align-content-center align-content-center align-self-center">
            <div class="col">
                <form action="ResetPassword.do" method="post" onsubmit="resetPasswordFormSubmit()">
                    <div class="form-group">
                        <label for="newPW">비밀번호</label>
                        <input id="newPW" class="form-control" type="password" placeholder="비밀번호" style="width: 200px;">
                        <input type="hidden" id="enc_newPW" name="new_pw">
                    </div>

                    <div class="form-group">
                        <label for="newPWVerify">비밀번호 확인</label>
                        <input id="newPWVerify" class="form-control" type="password" placeholder="비밀번호 확인"  style="width: 200px">
                        <input type="hidden" id="enc_newPW_verify" name="new_pw_verify">
                    </div>

                    <input type="hidden" value="${id}" name="id">

                    <button class="btn btn-secondary">제출</button>
                </form>
            </div>
        </div>
    </div>
</section>


</body>
</html>

