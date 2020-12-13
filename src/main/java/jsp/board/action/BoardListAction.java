package jsp.board.action;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.util.Action;
import jsp.util.ActionForward;
import jsp.util.Debug;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class BoardListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BoardDAO dao = BoardDAO.getInstance();
        HttpSession session = request.getSession();
        int page = Integer.parseInt(request.getParameter("page"));

        ArrayList<BoardBean> list = dao.getBoardList(page);
        int count = dao.getRowCount();

        session.setAttribute("boardlist", list);
        session.setAttribute("listcount", count);
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setNextPath("BoardList.board");
        Debug.debug("Board List Action Point");

        return forward;
    }
}
