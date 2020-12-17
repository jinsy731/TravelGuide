package jsp.board.action;

import jsp.board.model.BoardDAO;
import jsp.board.model.CommentBean;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;

public class BoardWriteCommentAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BoardDAO dao = BoardDAO.getInstance();
        CommentBean bean = new CommentBean();
        ActionForward forward = new ActionForward();

        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = format.format(new java.util.Date());
        int board_num = Integer.parseInt(request.getParameter("board_num"));
        String content = request.getParameter("content");

        if(content.length() > 1000) {
            response.setContentType("text/html; charset=utf-8");
            response.getWriter().print("<script> alert('문자열 길이 초과'); history.back(); </script>");
            return null;
        }

        bean.setContent(content);
        bean.setUser_id(request.getSession().getAttribute("sessionID").toString());
        bean.setWrite_date(date);

        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();

        if (!dao.insertComment(bean, board_num)) {
            out.print("<script> alert('등록 실패'); history.back(); </script>");
            return null;
        } else {
            String url = "BoardShowContentAction.board?board_num="+board_num;
            forward.setRedirect(true);
            forward.setNextPath(url);
            return forward;
        }

    }
}
