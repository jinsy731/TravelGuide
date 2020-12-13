package jsp.attraction.action;

import jsp.attraction.model.AttractionBean;
import jsp.attraction.model.AttractionDAO;
import jsp.attraction.model.AttractionReviewBean;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class AttractionContent implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        AttractionDAO dao = AttractionDAO.getInstance();
        AttractionBean bean = new AttractionBean();
        List<AttractionReviewBean> reviewBeanList = new ArrayList<AttractionReviewBean>();
        List<String> imgList = new ArrayList<String>();

        String attr_no = request.getParameter("attr_no");
        bean = dao.getAttrContent(attr_no);
        reviewBeanList = dao.getAttrReview(attr_no);
        imgList = dao.getAttrImg(attr_no);

        request.setAttribute("imgList", imgList);
        request.setAttribute("attr_bean", bean);
        request.setAttribute("reviewList", reviewBeanList);
        request.setAttribute("reviewCount", reviewBeanList.size());

        System.out.println(bean.getAttr_latitude() + "" + bean.getAttr_longitude());

        forward.setNextPath("./attraction/attractionContent.jsp");
        forward.setRedirect(false);

        return forward;
    }
}
