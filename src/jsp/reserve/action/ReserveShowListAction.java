package jsp.reserve.action;

import jsp.reserve.model.ReserveBean;
import jsp.reserve.model.ReserveDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class ReserveShowListAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ReserveDAO dao = ReserveDAO.getInstance();
        HttpSession session = request.getSession();
        System.out.println((String)session.getAttribute("sessionID"));
        ArrayList<ReserveBean> list = dao.getReserveList((String)session.getAttribute("sessionID"));
        session.setAttribute("reserve_list", list);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setNextPath("ReserveList.rsrv");

        return forward;
    }
}
