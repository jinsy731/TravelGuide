package jsp.reserve.action;

import jsp.reserve.model.ReserveBean;
import jsp.reserve.model.ReserveDAO;
import jsp.util.Action;
import jsp.util.ActionForward;
import jsp.util.ChangeDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class ReserveSubmitAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ReserveDAO dao = ReserveDAO.getInstance();
        ReserveBean bean = new ReserveBean();

        ActionForward forward = new ActionForward();

        request.setCharacterEncoding("UTF-8");


        ChangeDateFormat cdf = new ChangeDateFormat();
        String sdate = cdf.converseDateFormat(request.getParameter("startDate")+ ":00",  "yyyy년 MM월 dd일 HH:mm:ss", "yyyy-MM-dd HH:mm:ss");
        String edate = cdf.converseDateFormat(request.getParameter("endDate") + ":00",  "yyyy년 MM월 dd일 HH:mm:ss", "yyyy-MM-dd HH:mm:ss");
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        System.out.println(sdate + "//" + edate);
        System.out.println(format.parse(sdate).getTime());

        bean.setUser_id((String)request.getSession().getAttribute("sessionID"));
        bean.setReserve_date_start(sdate);
        bean.setReserve_date_end(edate);
        bean.setReserve_state("접수 중");


        for(String str : request.getParameterValues("course")) {
            ArrayList<String> list = bean.getReserve_course();
            list.add(str);
            bean.setReserve_course(list);
        }

        if( dao.insertReservation(bean) == true) {
            request.getSession().setAttribute("result", "success");
        }
        else
            request.getSession().setAttribute("result", "false");

        forward.setRedirect(false);
        forward.setNextPath("ReserveSubmitControl.rsrv");

        return forward;
    }
}
