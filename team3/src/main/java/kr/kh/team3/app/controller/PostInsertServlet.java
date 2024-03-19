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

import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

@WebServlet("/post/insert")
@MultipartConfig(//첨부파일 크기
		maxFileSize = 1024 * 1024 * 10, //10Mb
		maxRequestSize = 1024 * 1024 * 10 * 3, //10Mb 최대 3개
		fileSizeThreshold = 1024 * 1024 //1Mb : 파일 업로드 시 메모리에 저장되는 임시 파일 크기
	)
public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PostService postService = new PostServiceImp();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시판 리스트를 서비스를 통해 가져오기
		ArrayList<PostVO>list = postService.getBoardList();
		//화면에 게시판 리스트를 전송
		request.setAttribute("boardList", list);
		//게시글 입력 화면을 띄움
		request.getRequestDispatcher("/WEB-INF/view/post/insert.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//회원 정보를 가져옴
		//MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		//회원 정보 확인 -> 로그인 안내문구 출력
		/*
		if(user == null) {
			request.setAttribute("msg", "로그인이 후 사용 가능합니다.");
			request.setAttribute("url", "login");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
		}
		else {
			request.getRequestDispatcher("/WEB-INF/views/post/insert.jsp").forward(request, response);
		*/
		//화면에서 보낸 제목, 정보를 가져옴
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		//세션에서 회원 정보 불러오기
		//MemberVO user = (MemberVO)request.getSession().getAttribute("user");
		//회원정보가 없을 시
		/*
		if(user == null) {
			request.setAttribute("msg", "로그인이 후 사용 가능합니다.");
			request.setAttribute("url", "post/list");
			request.getRequestDispatcher("/WEB-INF/views/message.jsp").forward(request, response);
			return;
		}
		*/
		//String writer = user.getMe_id();
		String writer = "admin";
		//게시판 번호는 1번으로 저장
		int bo_num = Integer.parseInt(request.getParameter("board"));
		//제목, 내용, 작성자, 게시판 번호를 이용히여 게시글 작성
		PostVO post = new PostVO(title, content, writer, bo_num);
		//첨부파일을 가져옴
		ArrayList<Part>partList = (ArrayList<Part>)request.getParts();
		//PsotService에게 게시글 + 첨부파일 겍체를 등록하라고 시킴
		boolean res = postService.insertPost(post, partList);
		//등록을 하면 화면에 msg로 게시글 등록 안내 문구를 전송
		if(res) {
			request.setAttribute("msg", "게시글 등록완료");
		}
		//등록에 실패했을 경우 안내 문구 전송
		else {
			request.setAttribute("msg", "게시글 등록실패");
		}
		//화면에 url로 post/list를 전송
		request.setAttribute("url", "post/list");
		
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
		
	}

}
