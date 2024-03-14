package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.pagination.Criteria;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;


@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면에서 보낸 게시판 번호를 가져옴
		int num;
		
		try {
			num = Integer.parseInt(request.getParameter("boNum"));
		}catch (Exception e) {
			num = 0;
		}
		//서비스에게 게시글 번호를 주면서 게시글을 가져오라고 시킴
		PostVO post = postService.getPost(num);
		//화면에 게시글을 전송
		request.setAttribute("post", post);
		
		//검색어와 검색 타입을 가져옴. 현재 페이지 정보도 가져옴
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			page = 1;
		}
		//검색어, 검색 타입, 현재 페이지, 한 페이지 컨텐츠 개수를 이용하여 현재 페이지 정보 객체를 생성
		Criteria cri = new Criteria(page, 2, type, search);
		//검색어, 검색타입에 맞는 전체 게시글 개수를 가져옴
		int totalCount = postService.getTotalCount(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		//현재 페이지 정보에 맞는 게시글 리스트를 가져옴
		ArrayList<PostVO> list = postService.getPostList(cri);
		request.setAttribute("list", list);//화면에 전송
		request.getRequestDispatcher("/WEB-INF/view/post/list.jsp").forward(request, response);
	}
}
