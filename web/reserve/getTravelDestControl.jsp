
<%@ page contentType="application/json;charset=UTF-8" language="java" %>


<%
    response.setCharacterEncoding("UTF-8");
    response.setContentType("application/json");
    String json_str = (String)session.getAttribute("json");
    System.out.println("TravelDestControl에서 받은 session json : " + json_str);
    out.print(json_str);
%>
