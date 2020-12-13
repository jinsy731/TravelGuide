package jsp.board.action;

import jsp.board.model.BoardDAO;
import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardDeleteAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = (String)request.getSession().getAttribute("sessionID");
        int board_no = Integer.parseInt(request.getParameter("board_num"));

        MemberDAO memberDAO = MemberDAO.getInstance();
        BoardDAO boardDAO = BoardDAO.getInstance();
        response.setContentType("text/html; charset=utf-8");

        if (!memberDAO.verifyUser(id, board_no)) {
            response.getWriter().println("<script> alert('작성자만 삭제할 수 있습니다.'); history.back();</script> ");
            return null;
        }
        else {
            boardDAO.DeleteBoard(board_no);
            response.getWriter().println("<script> alert('삭제 완료'); location.href='BoardListAction.board?page=1' </script>");
            return null;
        }

    }
}
