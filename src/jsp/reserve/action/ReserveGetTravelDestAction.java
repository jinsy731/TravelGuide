package jsp.reserve.action;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import jsp.reserve.model.ReserveDAO;
import jsp.reserve.model.TravelInfoBean;
import jsp.util.Action;
import jsp.util.ActionForward;
import org.json.simple.JSONArray;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public class ReserveGetTravelDestAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ReserveDAO dao = ReserveDAO.getInstance();
        ArrayList<TravelInfoBean> beanList = new ArrayList<TravelInfoBean>();
        beanList = dao.getTravelDistList();

        Gson gson = new Gson();

        String json_str = gson.toJson(beanList);

        HttpSession session = request.getSession();
        session.setAttribute("json", json_str);

        ActionForward forward = new ActionForward();
        forward.setRedirect(true);
        forward.setNextPath("getTravelDestControl.rsrv");

        System.out.println("Ajax test11");
        System.out.println(json_str);

        return forward;
    }
}
