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


@WebServlet("/signup/update")
public class signupUpdateServlet extends HttpServlet {
	
	private static final long serialVersionUID = -5859656804856142498L;
	private MemberService memberService = new MemberServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		request.setAttribute("member", user);
		
		ArrayList<MemberVO>list = memberService.getMemberList();
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/signupUpdate.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		MemberVO member = new MemberVO();
		
		member.setMe_id(request.getParameter("me_id")); 
        member.setMe_pw(request.getParameter("me_pw"));
        member.setMe_email(request.getParameter("me_email"));
        member.setMe_phone(request.getParameter("me_phone"));
        
        boolean res = memberService.updateMember(member);
		
		if(res) {
			request.setAttribute("msg", "회원 정보를 수정했습니다.");
		}else {
			request.setAttribute("msg", "회원 정보 수정에 실패했습니다.");
		}
		request.setAttribute("url", "");
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
	}

}