package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

/**
 * Servlet implementation class PostTempServlet
 */
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 10, //10Mb
		maxRequestSize = 1024 * 1024 * 10 * 3, //10Mb 최대 3개
		fileSizeThreshold = 1024 * 1024 //1Mb : 파일 업로드 시 메모리에 저장되는 임시 파일 크기
	)
@WebServlet("/post/temp")
public class PostTempServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private PostService postService = new PostServiceImp();
	//임시저장된 글 불러오기
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
	}

	//게시글 임시저장
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		int bo_num = 0;
		try {
			bo_num = Integer.parseInt(request.getParameter("boNum"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		String writer = user.getMe_id();
		System.out.println(title+content+","+bo_num);
		
		PostVO tmpPost = new PostVO(bo_num,title,content,writer);
		tmpPost.setPo_temp(1);
		
		boolean res = postService.insertTempPost(tmpPost);
		
		response.getWriter().write(res?"OK":"");
		
		
	}

}
