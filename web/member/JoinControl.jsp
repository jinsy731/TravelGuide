
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JoinControl</title>
</head>
<body>
    <%
        if((int)session.getAttribute("joincheck") == 1) {
            out.print("<script>alert(\"Login Suceess\"); </script>");
            response.sendRedirect("main.do");
        }

        else if((int)session.getAttribute("joincheck") == -1) {
            out.print("<script>alert(\"Login Suceess\"); </script>");
            response.sendRedirect("JoinForm.do");
        }
    %>
</body>
</html>
