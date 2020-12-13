package jsp.member.action;

import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class MemberChangePasswordAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberDAO dao = MemberDAO.getInstance();
        String id = request.getSession().getAttribute("sessionID").toString();
        String pw = request.getParameter("pw");
        String new_pw = request.getParameter("new_pw");

        System.out.print("Change Action");

        String result = dao.changePassword(id,pw, new_pw);
        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();

        System.out.println("result : " + result);

        if (result.equals("invalid pw")) {
            out.print("<script> alert('잘못된 비밀번호 입니다.'); history.back(); </script>");
            return null;
        } else {
            ActionForward forward = new ActionForward();
            forward.setRedirect(false);
            forward.setNextPath("ChangePasswordControl.do");
            return forward;
        }
    }
}
