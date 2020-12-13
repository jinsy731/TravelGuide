package jsp.member.action;

import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ResetPassword implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        MemberDAO dao = MemberDAO.getInstance();

        String id = request.getParameter("id");
        String pw = request.getParameter("new_pw");
        String pw2 = request.getParameter("new_pw_verify");

        if (!pw.equals(pw2) || request.getAttribute("check1") == null) {
            response.setContentType("text/html; charset=utf-8");
            response.getWriter().print("<script> alert('비밀번호를 확인해주세요'); history.back(); </script>");
            return null;
        } else {
            dao.resetPassword(id, pw);
            forward.setNextPath("./change_complete.jsp");
            forward.setRedirect(false);
            return forward;
        }

    }
}
