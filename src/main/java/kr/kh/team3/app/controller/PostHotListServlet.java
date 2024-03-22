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

@WebServlet("/post/hotlist")
public class PostHotListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private BoardService boardService = new BoardServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boNum;
		try {
			boNum = Integer.parseInt(request.getParameter("boNum"));
		}catch (Exception e) {
			boNum = 0;
		}
		ArrayList<BoardVO> boardList = boardService.getBoardList();
		request.setAttribute("boardList", boardList);
		//검색어와 검색 타입을 가져옴. 현재 페이지 정보도 가져옴
		String search = request.getParameter("search");
		String type = request.getParameter("type");
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			page = 1;
		}
		Criteria cri = new Criteria(page, 2, type, search);
		int totalCount = postService.getTotalHotCount(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		ArrayList<PostVO> list = postService.getPostHotList(cri);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/post/hotlist.jsp").forward(request, response);
	}

}
