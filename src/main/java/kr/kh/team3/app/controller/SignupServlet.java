package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/signup")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/signup.jsp").forward(request, response);
	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		String id = request.getParameter("id");
//		String pw = request.getParameter("pw");
//		String email = request.getParameter("email");
//		
//		if(memberService.signup(new MemberVO(id, pw, email))) {
//			//회원가입에 성공하면 메인 페이지로 이동
//			response.sendRedirect(request.getContextPath() + "/");
//		}else {
//			//실패하면 회원가입 페이지 유지
//			doGet(request, response);
//		}
//
//	}

}
