package jsp.member.action;

import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;
import jsp.util.RSAEncrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.PrivateKey;

public class MemberLoginAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();
//        RSAEncrypt rsa = new RSAEncrypt();

        request.setCharacterEncoding("UTF-8");

        // 아이디와 비밀번호를 가져온다.
        String userId = request.getParameter("USER_ID");
        String userPw = request.getParameter("USER_PW");
        //PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");

//        System.out.println("복호화 전 ID : " + userId);
//        System.out.println("복호화 전 PW : " + userPw);

        // 복호화
//        userId = rsa.decryptRsa(privateKey, userId);
//        userPw = rsa.decryptRsa(privateKey, userPw);

//        System.out.println("복호화 후 ID : " + userId);
//        System.out.println("복호화 후 PW : " + userPw);

        // 개인키 삭제
//        session.removeAttribute("_RSA_WEB_Key_");

        // DB에서 아이디, 비밀번호 확인
        MemberDAO dao = MemberDAO.getInstance();
        int check = dao.auth(userId, userPw);

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
            session.setAttribute("sessionID", userId);
            session.setAttribute("result", "success");
        }

        forward.setRedirect(false);
        forward.setNextPath("LoginControl.do");

        return forward;
    }
}
