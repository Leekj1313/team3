package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.service.MemberService;
import kr.kh.team3.app.service.MemberServiceImp;

@WebServlet("/signup/delete")
public class SignupDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/meDropPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String me_id = request.getParameter("id");
		String me_pw = request.getParameter("pw");
		
		boolean res = memberService.deleteMember(me_id, me_pw); 
		
	    if(res) {
			request.setAttribute("msg", "회원탈퇴를 하였습니다.");
			request.setAttribute("url", "/");
		}else {
			request.setAttribute("msg", "회원탈퇴를 실패하였습니다.");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
		}
	}

}
