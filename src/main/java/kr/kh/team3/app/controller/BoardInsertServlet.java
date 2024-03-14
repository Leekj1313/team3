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
import kr.kh.team3.app.service.BoardService;
import kr.kh.team3.app.service.BoardServiceImp;

@WebServlet("/board/insert")
public class BoardInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private BoardService boardService = new BoardServiceImp();
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//서비스에게 카테고리 리스트를 가져오라고 시킴
		ArrayList<CategoryVO> list = boardService.getCategoryList();
		System.out.println(list);
		request.setAttribute("list", list);
		//화면에 카테고리 리스트를 보냄 
		request.getRequestDispatcher("/WEB-INF/view/board/insert.jsp").forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//카테고리 번호 저장
		int ca_num = 0;
		try {
			ca_num = Integer.parseInt(request.getParameter("category"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println(ca_num);
		//화면에서 보낸 제목을 가져옴
		String title = request.getParameter("title");
		//게시판명, 카테고리 번호를 이용하여 게시판 객체를 생성
		BoardVO board = new BoardVO(ca_num, title);
		//서비스에게 게시판 객체를 주면서 등록하라고 시킴
		boolean res = boardService.insertBoard(board);
		//등록을 하면 화면에 msg로 게시판을 등록했습니다라고 전송
		if(res) {
			request.setAttribute("msg", "게시판을 등록했습니다.");
		}
		//등록하지 못하면 화면에 msg로 게시판을 등록하지 못했습니다라고 전송
		else {
			request.setAttribute("msg", "게시판을 등록하지 못했습니다.");
		}
		//화면에 url로 메인으로를 전송
		request.setAttribute("url", "/");
		//message.jsp를 전송
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
		
	}

}
