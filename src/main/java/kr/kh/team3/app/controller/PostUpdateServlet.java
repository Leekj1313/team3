package kr.kh.team3.app.controller;

import java.io.IOException;
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
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.service.BoardService;
import kr.kh.team3.app.service.BoardServiceImp;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

@MultipartConfig(
		maxFileSize = 1024 * 1024 * 10, //10Mb
		maxRequestSize = 1024 * 1024 * 10 * 3, //10Mb 최대 3개
		fileSizeThreshold = 1024 * 1024 //1Mb : 파일 업로드 시 메모리에 저장되는 임시 파일 크기
	)
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
		PostVO post = postService.getPost(num);
	
		request.setAttribute("post", post);
		
		//작성자가 맞는지 확인
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		if( post == null || 
			!post.getPo_me_id().equals(user.getMe_id())) {
			request.setAttribute("msg", "작성자가 아닙니다");
			request.setAttribute("url", "board/detail?num="+num);
			request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
			return;
		}
		
		
		
		ArrayList<FileVO> fileList = postService.getFile(num);
		request.setAttribute("fileList", fileList);

		ArrayList<BoardVO> boardList = boardService.getBoardList();
		
		int index = -1;
		if(!user.getMe_authority().equals("ADMIN")){
			for(BoardVO board : boardList) {
				if(board.getBo_name().equals("공지")) {
					BoardVO tmp = board;
					index = boardList.indexOf(tmp);
				}
			}
			boardList.remove(index);
		}
		
		
		request.setAttribute("boardList", boardList);
		
		request.getRequestDispatcher("/WEB-INF/view/post/update.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		
		int num , boNum;
		try {
			num = Integer.parseInt(request.getParameter("num"));
			boNum = Integer.parseInt(request.getParameter("board"));
		}catch(Exception e) {
			num = 0;
			boNum = 0;
		}
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		//게시글 객체로 생성
		PostVO post = new PostVO(num, title, content, boNum);
		
		if(user.getMe_authority().equals("ADMIN") && boNum == 1) {
			post.setPo_notice(1);
			title = "[공지] "+ title;
			post.setPo_title(title);
		}else if(!user.getMe_authority().equals("ADMIN") && boNum ==1) {
			request.setAttribute("msg", "작성 권한이 없는 게시판입니다.");
			request.setAttribute("url","post/list?boNum="+boNum);
			request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
			return;
		}
		
		
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
