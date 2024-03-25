
package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.service.MemberService;
import kr.kh.team3.app.service.MemberServiceImp;

@WebServlet("/password/update")
public class PasswordUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		MemberVO user = memberService.getMember(id);
		request.setAttribute("user", user);
		request.getRequestDispatcher("/WEB-INF/view/passwordUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberVO user = memberService.getMember(id);
		
		boolean res = memberService.updatePassword(pw, user.getMe_id());
		if(res) {
			String state = "이용중";
			memberService.updateMemberState(user, state);
			memberService.failCountUp(user, 0);
			request.setAttribute("msg", "비밀번호 변경에 성공했습니다.");
			request.setAttribute("url", "/login");
		}else {
			request.setAttribute("msg", "비밀번호 변경에 실패했습니다.");
			request.setAttribute("url", "/find/password");
		}
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
	}

}
