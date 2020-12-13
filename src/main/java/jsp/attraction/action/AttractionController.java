package jsp.attraction.action;

import jsp.util.Action;
import jsp.util.ActionForward;
import jsp.util.Debug;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = {"*.attr"})
public class AttractionController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 넘어온 커맨드를 추출하는 과정
        String requestURI = request.getRequestURI();
        int cmdIdx = requestURI.lastIndexOf("/")+1;
        String command = requestURI.substring(cmdIdx);

        ActionForward forward = null;
        Action action = null;

        Debug.debug("command", command);

        try {
            // 화면전환
            if(command.equals("index.do")) // 메인화면 이동
            {
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("index.jsp");
            }

            // 각종 처리 액션
            else if(command.equals("AttractionList.attr"))
            {
                action = new AttractionList();
                forward = action.execute(request, response);
            }
            else if(command.equals("AttractionContent.attr"))
            {
                action = new AttractionContent();
                forward = action.execute(request, response);
            }
            else if(command.equals("AttractionSubmitReview.attr"))
            {
                action = new AttractionSubmitReview();
                forward = action.execute(request, response);
            }
            else if(command.equals("AttractionReserve.attr"))
            {
                action = new AttractionReserve();
                forward = action.execute(request, response);
            }


            // 화면이동 - isRedirext() 값에 따라 sendRedirect 또는 forward를 사용
            // sendRedirect : 새로운 페이지에서는 request와 response객체가 새롭게 생성된다.
            // forward : 현재 실행중인 페이지와 forwad에 의해 호출될 페이지는 request와 response 객체를 공유
            if(forward != null){
                if (forward.isRedirect()) {
                    response.sendRedirect(forward.getNextPath());
                } else {
                    RequestDispatcher dispatcher = request
                            .getRequestDispatcher(forward.getNextPath());
                    dispatcher.forward(request, response);
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    } // end doProcess
}
