package jsp.reserve.action;

import jsp.reserve.model.ReserveBean;
import jsp.reserve.model.ReserveDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class ReservePay implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        ReserveDAO dao = ReserveDAO.getInstance();
        HttpSession session = request.getSession();

        ArrayList<ReserveBean> beanList = (ArrayList<ReserveBean>)session.getAttribute("reserve_list");
        dao.reservePay(beanList);

        session.removeAttribute("reserve_list");
        session.removeAttribute("reserve_img");

        forward.setNextPath("./reserve/pay_complete.jsp");
        forward.setRedirect(false);

        return forward;

    }
}
