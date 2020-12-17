package jsp.reserve.action;

import jsp.reserve.model.ReserveDAO;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.PrintWriter;

public class ReserveDelete implements Action {
    @Override
    public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
        String id = request.getSession().getAttribute("sessionID").toString();
        String reserve_num = request.getParameter("reserve_num");

        ReserveDAO dao = ReserveDAO.getInstance();
        dao.deleteReserve(reserve_num, id);

        response.setContentType("text/html; charset=utf-8");
        PrintWriter out = response.getWriter();
        out.print("<script> alert('삭제되었습니다.'); location.href='ReserveShowListAction.rsrv?page=1'; </script>");

        return null;
    }
}
