package jsp.reserve.action;

import jsp.reserve.model.ReserveBean;
import jsp.reserve.model.ReserveDAO;
import jsp.util.Action;
import jsp.util.ActionForward;
import jsp.util.ChangeDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class ReserveSubmitAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ReserveDAO dao = ReserveDAO.getInstance();
        ReserveBean bean = new ReserveBean();

        ActionForward forward = new ActionForward();
        HttpSession session = request.getSession();

        request.setCharacterEncoding("UTF-8");


        ChangeDateFormat cdf = new ChangeDateFormat();
        String sdate = cdf.converseDateFormat(request.getParameter("startDate")+ ":00",  "yyyy년 MM월 dd일 HH:mm:ss", "yyyy-MM-dd HH:mm:ss");
        String edate = cdf.converseDateFormat(request.getParameter("endDate") + ":00",  "yyyy년 MM월 dd일 HH:mm:ss", "yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        System.out.println(sdate + "//" + edate);
        System.out.println(format.parse(sdate).getTime());

        bean.setUser_id((String)session.getAttribute("sessionID"));
        bean.setReserve_date_start(sdate);
        bean.setReserve_date_end(edate);
        bean.setReserve_state("접수중");
        bean.setReserve_price(Integer.parseInt(session.getAttribute("attr_reserve_price").toString()));
        bean.setDestination(request.getParameter("destination"));


        if( dao.insertReservation(bean) == true) {
            request.getSession().setAttribute("result", "success");
        }
        else
            request.getSession().setAttribute("result", "false");

        forward.setRedirect(false);
        forward.setNextPath("ReserveSubmitControl.rsrv");

        session.removeAttribute("attr_reserve_price");
        session.removeAttribute("attr_name");

        return forward;
    }
}
