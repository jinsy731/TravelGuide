package jsp.reserve.action;

import com.google.gson.Gson;
import jsp.reserve.model.ReserveDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ReserveGetCourseListAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        Gson gsonObj = new Gson();
        ReserveDAO dao = ReserveDAO.getInstance();
        ArrayList<String> list = new ArrayList<String>();

        ActionForward forward = new ActionForward();

        list = dao.getCourseList(request.getParameter("dest"));

        String jsonStr = gsonObj.toJson(list);
        request.getSession().setAttribute("course_result", jsonStr);

        forward.setRedirect(false);
        forward.setNextPath("CourseListControl.rsrv");

        return forward;
    }
}
