package jsp.filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import java.io.IOException;

@WebFilter(urlPatterns = {"/AttractionSubmitReview.attr", "/BoardWrite.board", "/BoardWriteCommentAction.board", "/Mypage.do","/ReserveShowListAction.rsrv","/ReserveSubmitAction.rsrv"})
public class LoginCheckFilter implements Filter {
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {

    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain filterChain) throws IOException, ServletException {
        response.setContentType("text/html; charset=utf-8");
        if (((HttpServletRequest) request).getSession().getAttribute("sessionID") == null) {
            response.getWriter().println("<script> alert('로그인 후 이용 가능합니다.'); history.back(); </script> ");
        } else {
          filterChain.doFilter(request, response);
        }
    }

    @Override
    public void destroy() {

    }
}
