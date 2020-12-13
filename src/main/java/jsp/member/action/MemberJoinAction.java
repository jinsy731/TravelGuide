package jsp.member.action;

import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;
import jsp.util.RSAEncrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.PrivateKey;

public class MemberJoinAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberBean member = new MemberBean();
        MemberDAO memberDAO = MemberDAO.getInstance();
        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();

        request.setCharacterEncoding("UTF-8");

        if (session.getAttribute("dupCheck") == null) {
            response.setContentType("text/html; charset=utf-8");
            response.getWriter().print("<script> alert('아이디 중복체크를 해주세요'); history.back(); </script>");
        } else {

        /*
            복호화 부분
         */
//        RSAEncrypt rsa = new RSAEncrypt();

            // 아이디와 비밀번호를 가져온다.
            String userId = request.getParameter("JOIN_USER_ID");
            String userPw = request.getParameter("JOIN_USER_PW");
//        PrivateKey privateKey = (PrivateKey) session.getAttribute("_RSA_WEB_Key_");
//
//        System.out.println("복호화 전 ID : " + userId);
//        System.out.println("복호화 전 PW : " + userPw);
//
//        // 복호화
//        userId = rsa.decryptRsa(privateKey, userId);
//        userPw = rsa.decryptRsa(privateKey, userPw);
//
//        System.out.println("복호화 후 ID : " + userId);
//        System.out.println("복호화 후 PW : " + userPw);
//
//        // 개인키 삭제
//        session.removeAttribute("_RSA_WEB_Key_");



            member.setUSER_ID(userId);
            member.setUSER_PASSWORD(userPw);
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
            session.removeAttribute("dupCheck");

        }
        return forward;
    }
}
