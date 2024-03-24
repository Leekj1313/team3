
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
		if(user.getMe_authority().equals(me_authority)){
			res = -2;
		}
		//관리자가 자신의 권한을 변경하려 할 때
		else if(nowUser.getMe_id().equals(me_id)) {
			res = -3;
		}
		//user.me_ms_state 값이 가입대기이면 user.me_ms_state 이용중으로 변경. res = -1
		//msg : 가입 승인 및 권한이 변경되었습니다.
		else if(user.getMe_authority().equals("WUSER")) {			
			user.setMe_authority(me_authority);
			user.setMe_ms_state("이용중");
			boolean result1 = memberService.updateMemberAuthority(user);
			res = -1;
		}
		//me_authority 값이 WUSER(가입대기) 이면 res = 2
		//msg : 권한이 변경되었습니다.
		else if(me_authority.equals("WUSER")) {
			user.setMe_authority("WUSER");
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
			request.setAttribute("msg", "가입 승인 및 권한이 변경되었습니다.");
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
	}

}
