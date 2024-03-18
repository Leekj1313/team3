package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.service.MemberService;
import kr.kh.team3.app.service.MemberServiceImp;

@WebServlet("/find/id")
public class FindIdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService memberService = new MemberServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/findId.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String phone = request.getParameter("phone");
		MemberVO user = memberService.getMember(name, phone);
		request.setAttribute("user", user);
		
		if(user != null) {
			request.setAttribute("msg", "해당 회원의 아이디는 " + user.getMe_id() + " 입니다.");
			request.setAttribute("url", "/login");
		}else {
			request.setAttribute("msg", "아이디 찾기에 실패했습니다.");
			request.setAttribute("url", "/find/id");
		}
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
	}

}
