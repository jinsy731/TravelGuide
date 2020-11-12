package jsp.reserve.action;

import jsp.board.action.BoardShowContentAction;
import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


public class ReserveController extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doProcess(request, response);
    }

    protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 넘어온 커맨드를 추출하는 과정
        String requestURI = request.getRequestURI();
        int cmdIdx = requestURI.lastIndexOf("/")+1;
        String command = requestURI.substring(cmdIdx);


        ActionForward forward = null;
        Action action = null;


        try {
            // 화면전환
            if(command.equals("ReserveForm.rsrv")) // 메인화면 이동
            {
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("/reserve/ReserveForm.jsp");
            }
            else if(command.equals("ReserveList.rsrv")) // 메인화면 이동
            {
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("/reserve/ReserveList.jsp");
            }

            else if(command.equals("CourseListControl.rsrv")) // 메인화면 이동
            {
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("/reserve/CourseListControl.jsp");
            }

            else if(command.equals("ReserveSubmitControl.rsrv")) // 메인화면 이동
            {
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("/reserve/ReserveSubmitControl.jsp");
            }


            else if(command.equals("ReserveGetCourseListAction.rsrv")) // 로그인 처리
            {
                action = new ReserveGetCourseListAction();
                forward = action.execute(request, response);
            }

            else if(command.equals("ReserveShowListAction.rsrv")) // 로그인 처리
            {
                action = new ReserveShowListAction();
                forward = action.execute(request, response);
            }

            else if(command.equals("ReserveSubmitAction.rsrv")) // 로그인 처리
            {
                action = new ReserveSubmitAction();
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
