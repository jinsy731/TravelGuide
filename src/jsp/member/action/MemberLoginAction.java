package jsp.member.action;

import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MemberLoginAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request,
                                 HttpServletResponse response) throws Exception {

        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();

        // 아이디와 비밀번호를 가져온다.
        String id = request.getParameter("id");
        String password = request.getParameter("pw");

        // DB에서 아이디, 비밀번호 확인
        MemberDAO dao = MemberDAO.getInstance();
        int check = dao.loginCheck(id, password);

        if(check == 0)    // 비밀번호 틀릴경우 -> 다시 로그인 화면으로 이동
        {
            // 로그인 실패시 메시지를 request에 담는다.
            session.setAttribute("result", "wrong_pw");
        }
        else if(check == -1) // 아이디가 없을 경우 -> 다시 로그인 화면으로 이동
        {
            session.setAttribute("result", "wrong_id");
        }
        else if(check == 1)
        {
            //로그인 성공 -> 세션에 아이디를 저장
            session.setAttribute("sessionID", id);
            session.setAttribute("result", "success");
        }

        forward.setRedirect(false);
        forward.setNextPath("LoginControl.do");

        return forward;
    }
}
