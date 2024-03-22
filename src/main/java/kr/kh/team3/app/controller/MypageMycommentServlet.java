package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.MyCommentVO;
import kr.kh.team3.app.pagination.Criteria;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

@WebServlet("/mypage/mycomment")
public class MypageMycommentServlet  extends HttpServlet {
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
		//검색어, 검색타입에 맞는 전체 게시글 개수를 가져옴
		int totalCount = postService.getMyCommentPostTotalCount(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		//현재 페이지 정보에 맞는 게시글 리스트를 가져옴
		ArrayList<MyCommentVO> list = postService.getMyCommentPostList(cri);
		//중복된 게시글 걸러내기..인데
		//중복 제거되면 한 페이지에 두개 보여져야 하는데 하나만 보여지는 문제
//		ArrayList<MyCommentVO> list = new ArrayList<MyCommentVO>();
//		ArrayList<Integer> commentIds = new ArrayList<>();
//		for(MyCommentVO comment:comments) {
//			if(!commentIds.contains(comment.getPo_num())) {
//				list.add(comment);
//				commentIds.add(comment.getPo_num());
//			}
//		}
		request.setAttribute("list", list);//화면에 전송

		request.getRequestDispatcher("/WEB-INF/view/mypage/mycomment.jsp").forward(request, response);
	}

}
