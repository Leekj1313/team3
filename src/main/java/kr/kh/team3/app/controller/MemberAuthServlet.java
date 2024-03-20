package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.pagination.Criteria;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.service.CategoryService;
import kr.kh.team3.app.service.CategoryServiceImp;
import kr.kh.team3.app.service.MemberService;
import kr.kh.team3.app.service.MemberServiceImp;

@WebServlet("/admin/memberauth")
public class MemberAuthServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//선택된 authority 값을 가져옴
		String me_authority = request.getParameter("authority");
		System.out.println(me_authority);
		
		//회원 정보
		String me_id = request.getParameter("id");
		MemberVO user = memberService.getMember(me_id);
		MemberVO nowUser = (MemberVO)request.getSession().getAttribute("user");
		
		int res;
		//user.me_authority와 전송된 me_authority값이 같으면 res = -2
		//msg : 이미 부여된 권한입니다.
		if(user.getMe_authority().equals(me_authority) && !(me_authority.equals("USER") && user.getMe_ms_state().equals("가입대기")) || (me_authority.equals("nUSER") && user.getMe_ms_state().equals("가입대기"))){
			res = -2;
			System.out.println(res);
		}
		
		//관리자가 자신의 권한을 변경하려 할 때
		else if(nowUser.getMe_id().equals(me_id)) {
			res = -3;
		}
		
		//user.me_ms_state 값이 가입대기이면 user.me_ms_state 이용중으로 변경. res = -1
		//msg : 가입이 승인되었습니다.
		else if(user.getMe_ms_state().equals("가입대기")) {			
			user.setMe_authority(me_authority);
			user.setMe_ms_state("이용중");
			boolean result1 = memberService.updateMemberAuthority(user);
			res = -1;
		}
		
		//user.me_authority 값이 nUSER(가입대기) 이면 res = 2
		//msg : 가입 승인 및 권한이 변경되었습니다.
		else if(me_authority.equals("nUSER")) {
			user.setMe_authority("USER");
			user.setMe_ms_state("가입대기");
			boolean result2 = memberService.updateMemberAuthority(user);
			res = 2;
		}
		
		//user.me_authority 값이 ADMIN, me_authority 값이 USER 이면 res = 1
		//msg : 권한이 변경되었습니다.
		else {
			user.setMe_authority(me_authority);
			user.setMe_ms_state("이용중");
			boolean result3 = memberService.updateMemberAuthority(user);
			res = 1;
		}
		
		if(res == -2) {
			request.setAttribute("msg", "이미 부여된 권한입니다.");
			request.setAttribute("url", "admin/membermanager");
		}
		else if(res == -3) {
			request.setAttribute("msg", "자신의 권한을 변경할 수 없습니다.");
			request.setAttribute("url", "admin/membermanager");
		}
		else if(res == -1) {
			request.setAttribute("msg", "가입이 승인되었습니다.");
			request.setAttribute("url", "admin/membermanager");
		}
		else if(res == 1) {
			request.setAttribute("msg", "권한이 변경되었습니다.");
			request.setAttribute("url", "admin/membermanager");
		}
		else if(res == 2) {
			request.setAttribute("msg", "권한이 변경되었습니다.");
			request.setAttribute("url", "admin/membermanager");
		}
		
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
		
		
		/*
		 * boolean res; //관리자 자신인지 확인 MemberVO user = (MemberVO)
		 * request.getSession().getAttribute("user"); if(user.getMe_id().equals(me_id))
		 * { res = false; System.out.println(user.getMe_id()); }else { res =
		 * memberService.deleteMember(me_id); }
		 * 
		 * 
		 * //삭제했으면 삭제했다고 알리고 회원 관리로 이동 if(res) { request.setAttribute("msg",
		 * "삭제되었습니다."); request.setAttribute("url", "admin/membermanager"); } //실패했으면
		 * 실패했다고 알리고 게시글 상세로 이동 else { request.setAttribute("msg", "삭제를 실패했습니다.");
		 * request.setAttribute("url", "admin/membermanager"); }
		 * 
		 * request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request,
		 * response);
		 */
	}

}
