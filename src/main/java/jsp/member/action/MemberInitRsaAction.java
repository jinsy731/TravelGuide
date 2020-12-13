package jsp.member.action;

import jsp.util.Action;
import jsp.util.ActionForward;
import jsp.util.RSAEncrypt;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberInitRsaAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String rsaKeyJson = new RSAEncrypt().initRsa(request);
        response.getWriter().print(rsaKeyJson);

        return null;
    }
}
