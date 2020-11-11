package jsp.member.action;

import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberModifyAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            HttpSession session = request.getSession();
            MemberDAO memberDAO = MemberDAO.getInstance();
            ActionForward forward = new ActionForward();

            if(memberDAO.updateMember((MemberBean)session.getAttribute("newinfo"))) {
                session.setAttribute("msg", 1);
                forward.setRedirect(false);
                forward.setNextPath("/UserInfoForm.do");
            }

            else {
                session.setAttribute("msg", -1);
                forward.setRedirect(false);
                forward.setNextPath("/ModifyForm.do");
            }

            return forward;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
