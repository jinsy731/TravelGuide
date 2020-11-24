<%@ page import="java.io.PrintWriter" %><%--
  Created by IntelliJ IDEA.
  User: jinsy
  Date: 2020-11-08
  Time: 오후 8:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String result = (String)session.getAttribute("result");
    System.out.println((String)session.getAttribute("result"));

    out.print(result);
%>
