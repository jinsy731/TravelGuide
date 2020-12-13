package jsp.board.action;

import jsp.board.model.BoardDAO;
import jsp.board.model.CommentBean;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;

public class BoardWriteCommentAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BoardDAO dao = BoardDAO.getInstance();
        CommentBean bean = new CommentBean();
        ActionForward forward = new ActionForward();


        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String date = format.format(new java.util.Date());

        bean.setContent(request.getParameter("content"));
        bean.setUser_id(request.getParameter("comment_id"));
        bean.setWrite_date(date);

        String result = null;
        if(dao.insertComment(bean, Integer.parseInt(request.getParameter("board_num")))) {
            result = "success";
        }
        else
            result = "failed";

        request.getSession().setAttribute("result", result);

        forward.setRedirect(true);
        forward.setNextPath("CommentSubmitControl.board");

        return forward;
    }
}
