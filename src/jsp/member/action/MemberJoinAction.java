package jsp.member.action;

import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberJoinAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberBean member = new MemberBean();
        MemberDAO memberDAO = MemberDAO.getInstance();
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();

        request.setCharacterEncoding("UTF-8");

        member.setUSER_ID(request.getParameter("id"));
        member.setUSER_PASSWORD(request.getParameter("pw"));
        member.setUSER_EMAIL(request.getParameter("email"));
        member.setUSER_ADDR(request.getParameter("addr"));
        member.setUSER_NAME(request.getParameter("name"));
        member.setUSER_PHONE(request.getParameter("phone"));
        member.setUSER_GENDER(request.getParameter("gender"));
        member.setUSER_HINT(request.getParameter("hint"));
        member.setUSER_BIRTH_YY(request.getParameter("date_yy"));
        member.setUSER_BIRTH_MM(request.getParameter("date_mm"));
        member.setUSER_BIRTH_DD(request.getParameter("date_dd"));

        if(memberDAO.insertMember(member)) {
            session.setAttribute("joincheck", 1);
            forward.setRedirect(false);
            forward.setNextPath("JoinControl.do");
        }
        else {
            session.setAttribute("joincheck", -1);
            forward.setRedirect(false);
            forward.setNextPath("JoinControl.do");
        }

        return forward;
    }
}
