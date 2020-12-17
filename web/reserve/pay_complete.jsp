
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
    <jsp:include page="../source.jsp"/>
</head>
<body>
<jsp:include page="../navbar.jsp"/>
<section class="page-section mt-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-4">
                <p>결제가 완료되었습니다. <br> 결제된 예약 내역은 마이 페이지에서 확인할 수 있습니다.</p>
                <a href="index.do"><button class="btn btn-secondary">메인 화면으로</button></a>
            </div>
        </div>
    </div>
</section>
<jsp:include page="../footer.jsp"/>
</body>
</html>