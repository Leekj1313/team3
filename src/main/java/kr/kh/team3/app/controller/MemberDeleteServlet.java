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

@WebServlet("/admin/memberdelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//삭제할 회원 아이디를 가져옴
		String me_id = request.getParameter("id");
		
		boolean res;
		//관리자 자신인지 확인
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		if(user.getMe_id().equals(me_id)) {
			res = false;
		}else {
			res = memberService.deleteMember(me_id);
		}
		
		//삭제했으면 삭제했다고 알리고 회원 관리로 이동
		if(res) {
			request.setAttribute("msg", "삭제되었습니다.");
			request.setAttribute("url", "admin/membermanager");
		}
		//실패했으면 실패했다고 알리고 게시글 상세로 이동
		else {
			request.setAttribute("msg", "삭제를 실패했습니다.");
			request.setAttribute("url", "admin/membermanager");
		}
		
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
	}

}
