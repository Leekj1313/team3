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


@WebServlet("/signup/update")
public class SignupUpdateServlet extends HttpServlet {
	
	private static final long serialVersionUID = -5859656804856142498L;
	
	private MemberService memberService = new MemberServiceImp();
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	MemberVO user = (MemberVO)request.getSession().getAttribute("user");
    	MemberVO newUser = memberService.getMember(user.getMe_id());
    	
    	//회원정보 화면에 출력
		request.setAttribute("member", newUser);
		request.getRequestDispatcher("/WEB-INF/view/signupUpdate.jsp").forward(request, response);   	
    }
		

}