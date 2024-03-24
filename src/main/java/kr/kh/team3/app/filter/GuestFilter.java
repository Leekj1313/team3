package kr.kh.team3.app.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpFilter;
import javax.servlet.http.HttpServletRequest;

import kr.kh.team3.app.model.vo.MemberVO;

@WebFilter({ "/find/password", "/login", "/signup", "/find/id" })
public class GuestFilter extends HttpFilter implements Filter {

	private static final long serialVersionUID = 1L;

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {

		MemberVO user = (MemberVO) ((HttpServletRequest) request).getSession().getAttribute("user");

		if (user != null) {
			request.setAttribute("msg", "로그인 한 회원은 이용할 수 없는 서비스입니다.");
			request.setAttribute("url", "");
			request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
			return;
		}

		chain.doFilter(request, response);
	}

}
