package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.pagination.Criteria;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.service.MemberService;
import kr.kh.team3.app.service.MemberServiceImp;

@WebServlet("/admin/membermanager")
public class MemberManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private MemberService memberService = new MemberServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		} catch (Exception e) {
			page = 1;
		}
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");

		Criteria cri = new Criteria(page, 2, type, search, user.getMe_id(), user.getMe_authority());
		// 검색어, 검색타입에 맞는 전체 회원수를 가져옴
		int totalCount = memberService.getTotalCountMember(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		// 현재 페이지 정보에 맞는 회원 리스트를 가져옴
		ArrayList<MemberVO> list = memberService.getMemberList(cri);
		request.setAttribute("list", list);// 화면에 전송

		request.getRequestDispatcher("/WEB-INF/view/admin/membermanager.jsp").forward(request, response);

	}
}
