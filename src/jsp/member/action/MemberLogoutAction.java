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

           // request의 헤더에서 이전 페이지의 URL을 뽑아 로그아웃 후 이전 페이지로 돌아감
           //forward.setNextPath(request.getHeader("referer"));
           forward.setNextPath("index.do");

           return forward;
       }
       catch (Exception e) {
           e.printStackTrace();
       }

       return null;
    }
}
