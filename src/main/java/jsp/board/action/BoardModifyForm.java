package jsp.board.action;

import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardModifyForm implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberDAO memberDAO = MemberDAO.getInstance();
        BoardDAO boardDAO = BoardDAO.getInstance();
        BoardBean bean;
        response.setContentType("text/html; charset=utf-8");

        String id = (String)request.getSession().getAttribute("sessionID");
        int board_no = Integer.parseInt(request.getParameter("board_num"));

        if (!memberDAO.verifyUser(id, board_no)) {
            response.getWriter().println("<script> alert('작성자만 삭제할 수 있습니다.'); history.back();</script> ");
            return null;
        }
        else {
            bean = boardDAO.getContent(board_no);
            request.setAttribute("boardbean", bean);
            ActionForward forward = new ActionForward();
            forward.setNextPath("board/BoardModify.jsp");
            return forward;
        }
    }
}
