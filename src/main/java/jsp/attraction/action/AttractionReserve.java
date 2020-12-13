package jsp.attraction.action;

import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AttractionReserve implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();

        request.setCharacterEncoding("UTF-8");
        request.getSession().setAttribute("attr_name", request.getParameter("attr_name"));
        forward.setNextPath("ReserveFormLoadAction.rsrv");
        forward.setRedirect(true);

        return forward;
    }
}
