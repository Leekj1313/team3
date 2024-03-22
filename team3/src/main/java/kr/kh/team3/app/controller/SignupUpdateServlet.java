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
    	request.getRequestDispatcher("/WEB-INF/view/signupUpdate.jsp").forward(request, response);    	
    }
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	   int num = 0;
	   try {
		   num = Integer.parseInt(request.getParameter("num"));
	   }catch(Exception e) {
		   e.printStackTrace();
	   }
	   String email = request.getParameter("email");
	   String phone = request.getParameter("phone");

	   MemberVO user = (MemberVO)request.getSession().getAttribute("user");
	   MemberVO member = new MemberVO(email, phone, user.getMe_id());
        
       boolean res = memberService.updateMember(member);
       if(res) {
			request.setAttribute("msg", "회원 정보를 수정했습니다.");
		}else {
			request.setAttribute("msg", "회원 정보 수정에 실패했습니다.");
		}
		request.setAttribute("url", "/");
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);

	}

}