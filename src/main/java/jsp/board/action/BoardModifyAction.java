package jsp.board.action;

import jsp.board.model.BoardDAO;
import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class BoardModifyAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = (String)request.getSession().getAttribute("sessionID");
        int board_no = Integer.parseInt(request.getParameter("board_num"));
        String subject = request.getParameter("modify_board_subject");
        String content = request.getParameter("modify_board_content");

        MemberDAO memberDAO = MemberDAO.getInstance();
        BoardDAO boardDAO = BoardDAO.getInstance();
        if (!memberDAO.verifyUser(id, board_no)) {
            response.getWriter().println("<script> alert('작성자만 삭제할 수 있습니다.'); </script> ");
            return null;
        }
        else {
            boardDAO.ModifyBoard(subject, content, board_no);
            ActionForward forward = new ActionForward();
            forward.setNextPath("BoardListAction.board?page=1");
            forward.setRedirect(false);
            return forward;
        }
    }
}
