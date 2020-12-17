package jsp.member.action;

import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class IDdupCheck implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberDAO dao = MemberDAO.getInstance();
        String id = request.getParameter("id");

        boolean check = dao.dupCheck(id);

        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        if (!check) {
            out.print("false");
        } else {
            out.print("true");
            request.getSession().setAttribute("dupCheck", check);
        }

        return null;
    }
}
