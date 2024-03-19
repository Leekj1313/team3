package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.FileVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

@WebServlet("/post/detail")
public class PostDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private PostService postService = new PostServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면에서 보내준 num을 가져옴
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			num = 0;
		}
		//서비스에게 게시글 번호가 num이 게시글의 조회수를 증가시키라고 시킴
		postService.updateView(num);
		//서비스에게 번호를 주고 번호가 num인 게시글을 불러오기
		PostVO post = postService.getPost(num);
		//게시글 조회해서 첨부파일 가져오기
		ArrayList<FileVO>fileList = postService.getFileList(num);
		//첨부파일 리스트를 화면에 전송
		request.setAttribute("fileList", fileList);
		//화면에 게시글 전송
		request.setAttribute("post", post);
		//게시판 상세를 화면에 전송
		request.getRequestDispatcher("/WEB-INF/view/post/detail.jsp").forward(request, response);
	}
}
