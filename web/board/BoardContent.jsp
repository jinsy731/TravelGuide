<%@ page import="jsp.board.model.BoardBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<jsp:useBean id="content" class="jsp.board.model.BoardBean" scope="session"/>

<html>
<head>
    <title>Title</title>
</head>
<body>

    <%
        content = (BoardBean)session.getAttribute("board_content");
        out.print("제목 : " + content.getBoard_subject() + "<br>");
        out.print("작성자 : " + content.getBoard_owner_id() + "<br>");
        out.print("작성일 : " + content.getBoard_date() + "<br>");
        out.print("글 번호 : " + content.getBoard_num() + "<br>");
        out.print("내용 : " + content.getBoard_content() + "<br>");
    %>

</body>
</html>
