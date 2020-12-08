package jsp.reserve.action;

import jsp.reserve.model.ReserveDAO;
import jsp.reserve.model.TravelInfoBean;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class ReserveFormLoadAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        ReserveDAO dao = ReserveDAO.getInstance();
        ArrayList<TravelInfoBean> bean = dao.getTravelDistList();

        HttpSession session = request.getSession();
        session.setAttribute("data", bean);

        forward.setNextPath("ReserveForm.rsrv");
        forward.setRedirect(true);

        return forward;
    }
}
