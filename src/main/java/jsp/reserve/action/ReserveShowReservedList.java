package jsp.reserve.action;

import jsp.reserve.model.ReserveBean;
import jsp.reserve.model.ReserveDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;
import java.util.ArrayList;

public class ReserveShowReservedList implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ReserveDAO dao = ReserveDAO.getInstance();
        ArrayList<ReserveBean> beanList;
        ArrayList<String> img = new ArrayList<String>();
        HttpSession session = request.getSession();

        String id = session.getAttribute("sessionID").toString();
        int page = 1;
        
        beanList = dao.getReserveCompleteList(id, page);

        for (ReserveBean bean : beanList) {
            img.add(dao.getImg(bean.getDestination()));
        }
        
        String html = "<div class=\"container\" id=\"reserveContainer\">\n" +
                "\n" +
                "            <div class=\"row justify-content-center\">\n" +
                "                <div class=\"card-group\">\n";

                for(int i=0; i < beanList.size(); i++) {
                    html +=
                            "                    <div class=\"col-md-6 col-lg-6 col-sm-6\">\n" +
                                    "                        <div class=\"card\" style=\"margin-top: 100px\">\n" +
                                    "                            <img class=\"card-img-top attr-card-img\" src=\"" + img.get(i)+ "\" alt=\"Card image cap\">\n" +
                                    "                            <div class=\"card-body\">\n" +
                                    "                                <h4 class=\"card-title\">" + beanList.get(i).getDestination()+ "</h4><br>\n" +
                                    "                                <p class=\"attr-card-text\">출발일 : " + beanList.get(i).getReserve_date_start()+ "</p>\n" +
                                    "                                <p class=\"attr-card-text\">도착일 : " + beanList.get(i).getReserve_date_end()+ "</p>\n" +
                                    "\n </div>\n" +
                                    "                        </div>\n" +
                                    "                    </div>\n";
                }
              html += "                </div>            </div>";

        System.out.println(html);

        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print(html);

        return null;
    }
}
