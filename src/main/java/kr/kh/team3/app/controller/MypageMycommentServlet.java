package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.pagination.Criteria;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

@WebServlet("/mypage/mycomment")
public class MypageMycommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			page = 1;
		}
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		Criteria cri = new Criteria(page, 2, type, search, user.getMe_id());
		System.out.println(cri);
		//검색어, 검색타입에 맞는 전체 게시글 개수를 가져옴
		int totalCount = postService.getMyPostTotalCount(cri);
		System.out.println("totalcaount : " + totalCount);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		System.out.println(pm.getStartPage());
		request.setAttribute("pm", pm);
		//현재 페이지 정보에 맞는 게시글 리스트를 가져옴
		ArrayList<PostVO> list = postService.getMyPostList(cri);
		request.setAttribute("list", list);//화면에 전송
		request.getRequestDispatcher("/WEB-INF/view/mypage/mycomment.jsp").forward(request, response);
	}

}
