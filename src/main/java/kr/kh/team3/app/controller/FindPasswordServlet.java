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

@WebServlet("/find/password")
public class FindPasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/findPw.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String phone = request.getParameter("phone");
		MemberVO user = memberService.getMemberPw(id, phone);
		request.setAttribute("user", user);
		
		if(user != null) {
			request.setAttribute("msg", "비밀번호 찾기에 성공했습니다.");
			request.setAttribute("url", "/password/update");
		}else {
			request.setAttribute("msg", "비밀번호 찾기에 실패했습니다.");
			request.setAttribute("url", "/find/password");
		}
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
	}

}
