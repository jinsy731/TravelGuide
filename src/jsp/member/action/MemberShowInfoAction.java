package jsp.member.action;

import jsp.member.model.MemberBean;
import jsp.member.model.MemberDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class MemberShowInfoAction implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        MemberDAO dao = MemberDAO.getInstance();
        String id = request.getSession().getAttribute("sessionID").toString();
        MemberBean bean = dao.getMemberInfo(id);

        String html = "<div id=\"userInfo\">\n" +
                "                        <p><span>아이디</span>" + bean.getUSER_ID() + "</p>\n" +
                "                        <p><span>이메일</span>" + bean.getUSER_EMAIL() + "</p>\n" +
                "                        <p><span>이름</span>" + bean.getUSER_NAME() +"</p>\n" +
                "                        <p><span>주소</span>" + bean.getUSER_ADDR() +"</p>\n" +
                "                        <p><span>전화번호</span>" + bean.getUSER_PHONE() + "</p>\n" +
                "                        <p><span>성별</span>" + bean.getUSER_GENDER() + "</p>\n" +
                "                        <p><span>생일</span>" + bean.getUSER_BIRTH_YY() + "년"
                                            + bean.getUSER_BIRTH_MM() + "월"
                                            + bean.getUSER_BIRTH_DD() + "일</p>\n" +
                "                    </div>  ";

        System.out.print(html);

        response.setContentType("text/html");
        response.setCharacterEncoding("UTF-8");
        response.getWriter().println(html);

        return null;
    }
}
