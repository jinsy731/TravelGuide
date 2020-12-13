package jsp.member.action;

import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberModifyFormAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            MemberDAO memberDAO = MemberDAO.getInstance();
            MemberBean member;

            member = memberDAO.getMemberInfo(request.getSession().getAttribute("sessionID").toString());
            request.getSession().setAttribute("userinfo",member);

            ActionForward forward = new ActionForward();
            forward.setRedirect(false);
            forward.setNextPath("/ModifyForm.do");

            return forward;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}

