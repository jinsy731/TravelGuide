package jsp.board.action;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class BoardShowContentAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BoardDAO dao = BoardDAO.getInstance();
        BoardBean bean;
        bean = dao.getContent(Integer.parseInt(request.getParameter("board_num")));

        HttpSession session = request.getSession();
        session.setAttribute("board_content", bean);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setNextPath("BoardContent.board");

        return forward;
    }
}
