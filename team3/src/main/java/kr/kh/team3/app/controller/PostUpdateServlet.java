package kr.kh.team3.app.controller;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.FileVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

@WebServlet("/post/update")
@MultipartConfig(
		maxFileSize = 1024 * 1024 * 10, //10Mb
		maxRequestSize = 1024 * 1024 * 10 * 3, //10Mb 최대 3개
		fileSizeThreshold = 1024 * 1024 //1Mb : 파일 업로드 시 메모리에 저장되는 임시 파일 크기
	)
public class PostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PostService postService = new PostServiceImp();
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			num = 0;
		}
		//게시글 번호와 일치하는 게시글을 가져옴
		PostVO post = postService.getPost(num);
		//게시판 리스트를 가져옴
		ArrayList<PostVO>list = postService.getBoardList();
		//게시글 번호를 이용하여 첨부파일 리스트를 가져옴
		ArrayList<FileVO>filelist = postService.getFileList(num);
		//게시글과 게시글 리스트를 화면에 전송
		request.setAttribute("list", list);
		request.setAttribute("post", post);
		request.getRequestDispatcher("/WEB-INF/view/post/update.jsp").forward(request, response);		
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 번호, 내용, 제목, 게시판 번호를 가져옴
		int num, bo_num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			bo_num = Integer.parseInt(request.getParameter("board"));
		}catch (Exception e) {
			num = 0;
			bo_num = 0;
		}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		//게시글 번호, 내용, 제목, 게시판 번호를 이용해서 게시글 객체를 생성
		PostVO post = new PostVO(title, content, "", bo_num);
		post.setPo_num(num);
		//회원을 가져옴
		//MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		//삭제할 첨부파일 번호
		String [] nums = request.getParameterValues("fi_num");
		//추가할 첨부파일 가져오기
		ArrayList<Part>partList = (ArrayList<Part>)request.getParts();
		//postService에게 수정 요청
		//boolean res = postService.updatePost(post, user, nums, partList);
		//유저는 임시 생략
		boolean res = postService.updatePost(post, nums, partList);
		if(res) {
			request.setAttribute("msg", "게시글을 수정했습니다");
		}
		//못햇으면 게시글을 수정하지 못했습니다라고 알림
		else {
			request.setAttribute("msg", "게시글을 수정하지 못했습니다");
		}
		//게시글 상세로 이동
		request.setAttribute("url", "post/detail?num="+num);
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
	}

}
