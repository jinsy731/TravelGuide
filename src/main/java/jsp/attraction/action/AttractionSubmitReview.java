package jsp.attraction.action;

import jsp.attraction.model.AttractionDAO;
import jsp.attraction.model.AttractionReviewBean;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class AttractionSubmitReview implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        ActionForward forward = new ActionForward();
        AttractionDAO dao = AttractionDAO.getInstance();
        AttractionReviewBean bean = new AttractionReviewBean();

        String user_id = request.getSession().getAttribute("sessionID").toString();
        String subject = request.getParameter("reviewSubject");
        String content = request.getParameter("reviewContent");
        int attr_no = Integer.parseInt(request.getParameter("attr_no"));

        if(content.length() > 2000 || subject.length() > 200) {
            response.setContentType("text/html; charset=utf-8");
            response.getWriter().print("<script> alert('문자열 길이 초과'); history.back(); </script>");
            return null;
        }

        bean.setReview_content(content);
        bean.setReview_subject(subject);
        bean.setUser_id(user_id);
        bean.setAttr_no(attr_no);

        dao.setAttrReview(bean);
        forward.setNextPath("AttractionContent.attr?attr_no="+attr_no);
        forward.setRedirect(false);

        return forward;
    }
}
