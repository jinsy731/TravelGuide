package jsp.member.action;

import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLogoutAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       try {
           HttpSession session = request.getSession();
           session.removeAttribute("sessionID");
           session.invalidate();

           ActionForward forward = new ActionForward();
           forward.setRedirect(true);
           forward.setNextPath("index.do");

           return forward;
       }
       catch (Exception e) {
           e.printStackTrace();
       }

       return null;
    }
}
