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

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String me_id = null;
		try {
            me_id = request.getParameter("num"); // me_id를 문자열로 받습니다.
        } catch (Exception e) {
            e.printStackTrace();
        }
	    MemberVO user = (MemberVO)request.getSession().getAttribute("user");
	    boolean res = memberService.deleteMember(user); 
	    if(res) {
			request.setAttribute("msg", "회원탈퇴 하였습니다.");
			request.setAttribute("url", "/");
		}else {
			request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
		}
	}

}
