package jsp.board.action;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class BoardListAction implements Action {

    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        BoardDAO dao = BoardDAO.getInstance();
        HttpSession session = request.getSession();
        ArrayList<BoardBean> list = dao.getBoardList(1);

        session.setAttribute("boardlist", list);
        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setNextPath("BoardList.board");

        return forward;
    }
}
