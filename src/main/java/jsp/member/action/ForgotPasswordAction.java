package jsp.member.action;

import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ForgotPasswordAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        MemberDAO dao = MemberDAO.getInstance();

        String id = request.getParameter("id");
        String email = request.getParameter("email");
        String hint = request.getParameter("hint");

        boolean check = dao.forgotPassword(id, email, hint);

        if (!check) {
            response.setContentType("text/html; charset=utf-8");
            response.getWriter().print("<script> alert('회원정보가 일치하지 않습니다.'); history.back(); </script>");
            return null;
        } else {
            request.setAttribute("id", id);
            request.setAttribute("check1", "true");
            forward.setNextPath("./ResetPassword.jsp");
            forward.setRedirect(false);
            return forward;
        }
    }
}
