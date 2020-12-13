package jsp.attraction.action;

import jsp.util.Action;
import jsp.util.ActionForward;
import jsp.util.Crawler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AttractionList implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        forward.setNextPath("./attraction/attractionList.jsp");
        forward.setRedirect(false);
        return forward;

    }
}
