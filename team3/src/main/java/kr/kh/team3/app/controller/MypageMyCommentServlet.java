package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.kh.team3.app.model.vo.CommentVO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.pagination.CommentCriteria;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

@WebServlet("/mypage/mycomment")
public class MypageMyCommentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int page = 1;
		int poNum = 0;
		String meId = null;
		try {
			page = Integer.parseInt(request.getParameter("page"));
			poNum = Integer.parseInt(request.getParameter("boNum"));
			poNum = Integer.parseInt(request.getParameter("Me_id"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		MemberVO user = (MemberVO)request.getSession().getAttribute("user");

		CommentCriteria cri = new CommentCriteria(page, 2, poNum, user.getMe_id());
		ArrayList<CommentVO>list = postService.getCommentList(cri);
		//전체 댓글 수
		int totalCount = postService.getTotalCountComment(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		JSONObject jobj = new JSONObject();
		ObjectMapper om = new ObjectMapper();
		try {
			String pmStr = om.writeValueAsString(pm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		jobj.put("list", list);
		jobj.put("pm", pmStr);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

}
