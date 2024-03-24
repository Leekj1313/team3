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
@WebServlet("/post/insert")
public class PostInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private BoardService boardService = new BoardServiceImp();
    private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bNum = Integer.parseInt(request.getParameter("bNum"));
		ArrayList<BoardVO> boardList = boardService.getBoardList();
		
		request.setAttribute("boardList", boardList);
		request.setAttribute("bNum", bNum);
		request.getRequestDispatcher("/WEB-INF/view/post/insert.jsp").forward(request, response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		ArrayList<Part> partList = (ArrayList<Part>) request.getParts();
		int bo_num = 0;
		try {
			bo_num = Integer.parseInt(request.getParameter("board"));
		}catch(Exception e) {
			e.printStackTrace();
		}

		String title = request.getParameter("title");
		String content = request.getParameter("content");
		String writer = user.getMe_id();
		
		PostVO post = new PostVO(bo_num,title,content,writer);
		boolean res = false;
		//임시저장 글을 불러온채로 등록하는지에 대한 여부
		boolean isTemp = Boolean.parseBoolean(request.getParameter("isTemp"));
		if(isTemp) {
			int po_num =0;
			try {
				po_num = Integer.parseInt(request.getParameter("po_num_temp"));
			}catch(Exception e) {
				e.printStackTrace();
			}
			res = postService.submitTmpPost(post,po_num,partList);
			post.setPo_num(po_num);
		}else {
			res = postService.insertPost(post, partList);
		}
		
		if(res) {
			request.setAttribute("msg", "게시글 등록 완료");
			request.setAttribute("url", "post/detail?num="+post.getPo_num());
		}else {
			request.setAttribute("msg", "게시글 등록 실패");
			request.setAttribute("url","post/list?boNum="+bo_num);
		}
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);	
	}

}