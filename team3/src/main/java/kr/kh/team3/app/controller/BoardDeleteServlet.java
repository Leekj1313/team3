package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.service.BoardService;
import kr.kh.team3.app.service.BoardServiceImp;

@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	private BoardService boardService = new BoardServiceImp();
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num = 0;
    	try {
    		num = Integer.parseInt(request.getParameter("num"));
    	}catch (Exception e) {
    		e.printStackTrace();
		}
    	
    	MemberVO user = (MemberVO) request.getSession().getAttribute("user");
    	int res = boardService.deleteBoard(num,user);
    	
    	response.getWriter().write(res + "");
	}

}