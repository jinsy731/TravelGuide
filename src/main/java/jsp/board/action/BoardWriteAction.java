package jsp.board.action;

import com.nhncorp.lucy.security.xss.XssPreventer;
import jsp.board.model.BoardBean;
import jsp.board.model.BoardDAO;
import jsp.util.Action;
import jsp.util.ActionForward;
import org.owasp.esapi.ESAPI;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;

public class BoardWriteAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        request.setCharacterEncoding("UTF-8");

        BoardDAO dao = BoardDAO.getInstance();
        BoardBean bean = new BoardBean();

        String board_content = request.getParameter("board_content");
        String board_subject = request.getParameter("board_subject");

        if(board_content.length() > 2000 || board_subject.length() > 200) {
            response.setContentType("text/html; charset=utf-8");
            response.getWriter().print("<script> alert('문자열 길이 초과'); history.back(); </script>");
            return null;
        }

        Date date = new Date(new java.util.Date().getTime());
        bean.setBoard_date(date);
        bean.setBoard_content(board_content);
        bean.setBoard_owner_id((String)request.getSession().getAttribute("sessionID"));
        bean.setBoard_subject(board_subject);

        HttpSession session = request.getSession();
        dao.insertBoard(bean);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setNextPath("BoardListAction.board?page=1");

        return forward;
    }
}
