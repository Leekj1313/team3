package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.service.BoardService;
import kr.kh.team3.app.service.BoardServiceImp;


@WebServlet("/post/list")
public class PostListServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	private BoardService boardService = new BoardServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int boNum = 0;

		try {
			boNum = Integer.parseInt(request.getParameter("boNum"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		ArrayList<PostVO> postList = boardService.getPostList(boNum);
		request.setAttribute("postList", postList);
		request.getRequestDispatcher("/WEB-INF/view/post/list.jsp").forward(request, response);
		
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
