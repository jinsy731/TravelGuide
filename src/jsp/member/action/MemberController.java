package jsp.member.action;

import jsp.util.Action;
import jsp.util.ActionForward;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import javax.servlet.ServletException;


public class MemberController extends javax.servlet.http.HttpServlet {
    protected void doPost(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doProcess(request, response);
    }

    protected void doGet(javax.servlet.http.HttpServletRequest request, javax.servlet.http.HttpServletResponse response) throws javax.servlet.ServletException, IOException {
        doProcess(request, response);
    }

    public void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // 넘어온 커맨드를 추출하는 과정
        String requestURI = request.getRequestURI();
        int cmdIdx = requestURI.lastIndexOf("/")+1;

        String command = requestURI.substring(cmdIdx);

        ActionForward forward = null;
        Action action = null;


        try {
            // 화면전환
            if(command.equals("index.do")) // 메인화면 이동
            {
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("index.jsp");
            }
            else if(command.equals("LoginControl.do"))    // 로그인 컨트롤 jsp
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("member/LoginControl.jsp");
            }
            else if(command.equals("JoinForm.do"))    // 회원가입화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("member/join.jsp");
            }
            else if(command.equals("UserInfoForm.do"))    // 내정보 클릭 - 회원정보화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("member/userinfo.jsp");
            }
            else if(command.equals("ModifyForm.do")) // 회원수정화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("member/modify.jsp");
            }
            else if(command.equals("DeleteForm.do")) // 회원삭제화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("member/DeleteForm.jsp");
            }
            else if(command.equals("JoinControl.do"))
            {
                forward = new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("member/JoinControl.jsp");
            }
            else if(command.equals("Result.do")) // 각종 처리결과 화면 이동
            {
                forward=new ActionForward();
                forward.setRedirect(false);
                forward.setNextPath("member/ResultForm.jsp");
            }

            // 각종 처리 액션
            else if(command.equals("MemberLoginAction.do")) // 로그인 처리
            {
                action = new MemberLoginAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberLogoutAction.do")) // 로그아웃 처리
            {
                action = new MemberLogoutAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberJoinAction.do")) // 회원가입 처리
            {
                action = new MemberJoinAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberInfoAction.do")) // 회원정보화면에 보여줄 정보 처리
            {
                action = new MemberInfoAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberModifyFormAction.do")) // 회원수정화면에 보여줄 정보 처리
            {
                action = new MemberModifyFormAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberModifyAction.do")) // 회원수정 처리
            {
                action = new MemberModifyAction();
                forward = action.execute(request, response);
            }
            else if(command.equals("MemberDeleteAction.do")) // 회원삭제 처리
            {
                action = new MemberDeleteAction();
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
