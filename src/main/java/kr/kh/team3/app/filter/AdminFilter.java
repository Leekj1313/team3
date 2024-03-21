package kr.kh.team3.app.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import kr.kh.team3.app.model.vo.MemberVO;

/**
 * Servlet Filter implementation class AdminFilter
 */
@WebFilter({"/board/manager","/board/insert","/board/delete", "/board/update", "/category/list", "/report/list", "/report/update", "report/delete", "/category/delete", "/category/insert", "/category/update", "/admin/membermanager"})

public class AdminFilter extends HttpFilter implements Filter {
	
	private static final long serialVersionUID = -5262224032098686359L;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		//회원 정보를 가져옴
		MemberVO user = (MemberVO)((HttpServletRequest)request).getSession().getAttribute("user");
		//회원 정보가 없으면 로그인이 필요한 서비스입니다 라고 알림 후 로그인페이지로 이동

		if(user==null||!user.getMe_authority().equals("ADMIN")) {
			request.setAttribute("msg", "권한이 없습니다.");
			request.setAttribute("url", "");
			request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
			return;
		}
		//있으면 하려던 작업을 수행
		chain.doFilter(request, response);
	}

}


