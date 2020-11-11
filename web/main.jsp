<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>메인화면</title>

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.min.js" integrity="sha384-w1Q4orYjBQndcko6MimVbzY0tgp4pWB4lZ7lr30WKz0vr/aWKhXdBNmNb5D92v7s" crossorigin="anonymous"></script>

    <script>
        function clickLogin() { location.href ="LoginForm.do";}
        function clickJoin() { location.href = "JoinForm.do";}
        function clickModify() {location.href = "ModifyForm.do";}
        function clickLogout() { location.href = "MemberLogoutAction.do";}
    </script>
</head>
<body>

    <%
        if(session.getAttribute("sessionID") != null) {
            out.print("<button id = \"BTN_MODIFY\" onclick = \"clickModify()\">정보 수정 </button>");
            out.print("<button id = \"BTN_LOGOUT\" onclick = \"clickLogout()\">로그 아웃 </button>");
        }
        else {
            out.print("<button id = \"BTN_LOGIN\" onclick =\"clickLogin()\" width=\"20\">로그인</input>");
            out.print("<button id = \"BTN_JOIN\" onclick =\"clickJoin()\" width=\"20\">회원가입</input>");

        }
    %>

</body>
</html>
