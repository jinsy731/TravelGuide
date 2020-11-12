<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String jsonStr = (String)session.getAttribute("course_result");
    System.out.println(jsonStr);
    out.print(jsonStr);
%>