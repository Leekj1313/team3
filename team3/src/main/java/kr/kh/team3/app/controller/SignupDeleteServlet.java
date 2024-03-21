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

@WebServlet("/signup/delete")
public class SignupDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/meDropPage.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		String me_id = null;
		
		try {
            me_id = request.getParameter("id");
        } catch (Exception e) {
            e.printStackTrace();
        }
		String me_pw = request.getParameter("pw");
		
		
		System.out.println(me_id);
		System.out.println(me_pw);
		
//		System.out.println(res);
		
		boolean res = memberService.deleteMember(me_id,me_pw,user); 
	    if(res) {
			request.setAttribute("msg", "회원탈퇴를 하였습니다.");
			request.setAttribute("url", "/");
			request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
		}else {
			request.setAttribute("msg", "회원탈퇴를 실패하였습니다.");
			request.setAttribute("url", "/signup/delete");
			request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
		}
	}

}
