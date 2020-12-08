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
        String id = (String)session.getAttribute("sessionID");
        int page = Integer.parseInt(request.getParameter("page"));
        int count = dao.getRowCount(id);

        System.out.print(count);
        ArrayList<ReserveBean> list = dao.getReserveList(id, page);
        session.setAttribute("reserve_list_count", count);
        session.setAttribute("reserve_list", list);

        ActionForward forward = new ActionForward();
        forward.setRedirect(false);
        forward.setNextPath("ReserveList.rsrv");

        return forward;
    }
}
