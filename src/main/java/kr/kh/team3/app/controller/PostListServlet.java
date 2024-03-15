package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.pagination.Criteria;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.service.BoardService;
import kr.kh.team3.app.service.BoardServiceImp;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;


@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private BoardService boardService = new BoardServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boNum = 0;
		try {
			boNum = Integer.parseInt(request.getParameter("boNum"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			page = 1;
		}
		BoardVO board = boardService.getBorad(boNum);
		request.setAttribute("board", board);
		Criteria cri = new Criteria(page, 2, type, search, boNum);
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
