<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String result = (String)session.getAttribute("result");
    out.print(result);
%>