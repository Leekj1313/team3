package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

@WebServlet("/post/delete")
public class PostDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private PostService postService = new PostServiceImp();


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//게시글 번호 가져오기
		int num;
		
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch (Exception e) {
			num = 0;
		}
		//회원 정보를 가져옴
		//MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		//boolean res = postService.deletePost(num, user);
		//테스트 상 유저 없이 진행
		boolean res = postService.deletePost(num);
		if(res) {
			request.setAttribute("msg", "게시글을 삭제 했습니다.");
			request.setAttribute("url", "post/list");
		}
		//실패 했으면 실패했다고 알리고 게시글 상세로 이동
		else {
			request.setAttribute("msg", "게시글을 삭제하지 못했습니다.");
			request.setAttribute("url", "post/detail?num="+num);
		}
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
	}
}

}
