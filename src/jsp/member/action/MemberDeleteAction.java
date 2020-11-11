package jsp.member.action;

import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberDeleteAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        try {
            HttpSession session = request.getSession();
            MemberDAO memberDAO = MemberDAO.getInstance();
            ActionForward forward = new ActionForward();
            forward.setRedirect(false);

            int check = memberDAO.deleteMember(session.getAttribute("sessionID").toString());

            if(check == 1) {
                forward.setNextPath("/MainForm.do");
                session.setAttribute("msg", 1);
            }
            else if(check == 0) {
                forward.setNextPath("/DeleteForm.do");
                session.setAttribute("msg", -1);
            }

            return forward;
        }
        catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
