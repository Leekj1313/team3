package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.pagination.BoardCriteria;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.service.BoardService;
import kr.kh.team3.app.service.BoardServiceImp;

@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private BoardService boardService = new BoardServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int caNum = 0;
		try {
			caNum = Integer.parseInt(request.getParameter("caNum"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		CategoryVO category = boardService.getCategory(caNum);
		request.setAttribute("category", category);
		
		int page;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch(Exception e) {
			page = 1;
		}
		BoardCriteria cri = new BoardCriteria(page, 2, caNum);
		//검색어, 검색타입에 맞는 전체 게시글 개수를 가져옴 
		int totalCount = boardService.getTotalCountBoard(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		//현재 페이지 정보에 맞는 게시글 리스트를 가져옴
		ArrayList<BoardVO> list = boardService.getBoardList(cri);
		request.setAttribute("list", list);//화면에 전송
		request.getRequestDispatcher("/WEB-INF/view/board/list.jsp").forward(request, response);
	}

}
