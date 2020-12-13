package jsp.member.action;

import jsp.util.Action;
import jsp.util.ActionForward;

import javax.crypto.Cipher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.security.*;
import java.security.spec.RSAPublicKeySpec;

public class LoginCheckAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

        HttpSession session = request.getSession();
        String result;
        if(session.getAttribute("sessionID") != null)
            result = "true";
        else
            result = "false";

        System.out.println("LoginCheckAction");
        System.out.println(session);

        //ajax 응답시 ActionForward를 별도로 리턴하지 않고 바로 응답
        response.getWriter().println(result);
        return null;
    }
}



