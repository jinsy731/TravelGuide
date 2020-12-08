package jsp.member.action;

import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

public class MemberSecessionAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();

        String id = request.getSession().getAttribute("sessionID").toString();
        String pw = request.getParameter("pw");

        MemberDAO dao = MemberDAO.getInstance();
        String result = dao.deleteMember(id, pw);

        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();

        if (result.equals("invalid pw")) {
            forward = null;
            out.println("<script> alert('잘못된 비밀번호입니다.'); history.back(); </script>");
        } else {
            HttpSession session = request.getSession();
            session.removeAttribute("sessionID");
            session.invalidate();

            forward.setNextPath("SecessionControl.do");
            forward.setRedirect(false);
        }
        return forward;
    }
}
