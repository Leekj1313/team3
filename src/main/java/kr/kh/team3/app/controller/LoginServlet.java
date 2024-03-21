package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.kh.team3.app.model.dto.LoginDTO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.service.MemberService;
import kr.kh.team3.app.service.MemberServiceImp;


@WebServlet("/login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private MemberService memberService = new MemberServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/login.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		MemberVO user = memberService.login(new LoginDTO(id,pw));
		
		
		
		//성공하면 세션에 회원 정보를 저장하고 메인페이지로 이동
		if(user != null) {
			
			if(!user.getMe_ms_state().equals("이용중")) {
				request.setAttribute("msg", "현재 계정이 " + user.getMe_ms_state() + " 상태라 로그인이 불가능합니다.");
				request.setAttribute("url", "/login");
				request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
				return;
			}
			
			memberService.failCountUp(user, 0);
			request.setAttribute("msg", "로그인에 성공했습니다.");
			request.setAttribute("url", "");
			request.getSession().setAttribute("user", user);
		}
		//실패하면 로그인 페이지로 이동
		else{
			MemberVO failUser = memberService.getMember(id);
			int failCount;
			
			if(failUser != null) {
				failCount = failUser.getMe_fail_count() + 1;
				memberService.failCountUp(failUser, failCount);
				request.setAttribute("msg", "로그인에 실패했습니다. 현재 실패횟수는 " + failCount + "번 입니다.");
				request.setAttribute("url", "/login");
			}else {
				request.setAttribute("msg", "로그인에 실패했습니다.");
				request.setAttribute("url", "/login");
				request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
			}
			
			if(failUser.getMe_fail_count() >= 5){
				String state = "정지";
				memberService.updateMemberState(failUser, state);
				request.setAttribute("msg", "로그인 5회 초과 실패하여 계정이 정지됩니다. 비밀번호 찾기를 통해 풀고 다시 시도하세요.");
				request.setAttribute("url", "/login");
			}
		}
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
	}

}

