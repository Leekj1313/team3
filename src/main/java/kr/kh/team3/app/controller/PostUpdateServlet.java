package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import kr.kh.team3.app.model.vo.FileVO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.service.BoardService;
import kr.kh.team3.app.service.BoardServiceImp;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;


@WebServlet("/post/update")
public class PostUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	private BoardService boardService = new BoardServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			num = 0;
		}
		//서비스에게 게시글 번호를 주면서 게시글을 가져오라고 시킴 : 이미 구현 
		PostVO post = postService.getPost(num);
		//가져온 게시글을 화면에 전송
		request.setAttribute("post", post);
		
		//작성자가 맞는지 확인
		//세션에서 회원 정보를 가져옴
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		//게시글 작성자와 회원아이디가 같은지 확인
		//다르면 게시글 상세로 보내고, 작성자가 아닙니다라고 메시세지를 띄움
		if( post == null || 
			//user == null || 
			!post.getPo_me_id().equals(user.getMe_id())) {
			request.setAttribute("msg", "작성자가 아닙니다");
			request.setAttribute("url", "board/detail?num="+num);
			request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
			return;
		}
		
		ArrayList<FileVO> fileList = boardService.getFile(num);
		request.setAttribute("fileList", fileList);
		//같으면		
		//게시판을 가져와서 화면에 전달
		//서비스에게 게시판 리스트를 가져오라고 시킴
		ArrayList<PostVO> list = postService.getPostList();
		//게시판 리스트를 화면에 전송
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/post/update.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		int num , boNum;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			boNum = Integer.parseInt(request.getParameter("boNum"));
		}catch(Exception e) {
			num = 0;
			boNum = 0;
		}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		//게시글 객체로 생성
		PostVO post = new PostVO(num, title, content, boNum);
		
		//새로 추가된 첨부파일 정보 가져옴
		ArrayList<Part> fileList = (ArrayList<Part>) request.getParts();
		//삭제할 첨부파일 정보 가져옴
		String numsStr [] = request.getParameterValues("fi_num");
		
		ArrayList<Integer> nums = new ArrayList<Integer>();
		if(numsStr != null) {
			for(String numStr : numsStr) {
				try {
					int fi_num = Integer.parseInt(numStr);
					nums.add(fi_num);
				}catch (Exception e) {
				}
			}
		}
		//서비스에게 게시글과 회원정보를 주면서 게시글 수정하라고 요청
		boolean res = postService.updatePost(post, user, nums, fileList);
		if(res) {
			request.setAttribute("msg", "게시글을 수정했습니다.");	
		}
		else {
			request.setAttribute("msg", "게시글을 수정하지 못했습니다.");
		}
		request.setAttribute("url", "post/detail?num="+num);
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
	}

}
