package jsp.member.action;

import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberInfoAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            HttpSession session = request.getSession();
            MemberDAO memberDAO = MemberDAO.getInstance();
            MemberBean member = memberDAO.getMemberInfo(session.getAttribute("sessionID").toString());

            session.setAttribute("userInfo", member);

            ActionForward forward = new ActionForward();
            forward.setRedirect(false);
            forward.setNextPath("/UserInfoForm.do");

            return forward;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
