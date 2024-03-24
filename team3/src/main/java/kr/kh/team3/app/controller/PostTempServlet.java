
package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

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
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		ArrayList<PostVO>tmpList = postService.getTmpPostList(user);
		JSONObject jobj = new JSONObject();
		jobj.put("tmpList", tmpList);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
		
	}

	//게시글 임시저장
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		MemberVO user = (MemberVO) request.getSession().getAttribute("user");
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		
		int bo_num = 0;
		int count = -1;
		try {
			bo_num = Integer.parseInt(request.getParameter("boNum"));
			count = Integer.parseInt(request.getParameter("count"));
		}catch(Exception e) {
			e.printStackTrace();
		}
		String writer = user.getMe_id();
		PostVO tmpPost = new PostVO(bo_num,title,content,writer);
		//임시게시글 : 1 일반 게시글 : 0
		tmpPost.setPo_temp(1);
		//결과 값을 저장할 res
		boolean res = false;
		int po_num = 0;
		//첫 번째 임시저장이라면 insert
		if(count==0) {
			//저장한 기본키(po_num)를 받아옴
			po_num = postService.insertTmpPost(tmpPost);
			//제대로 받았다면 true
			if (po_num >0) {
				res = true;
			}
		//두 번째 임시저장이라면 count 가 1이되며, update 활용
		}else if(count==1) {
			//ajax에 저장한 po_num
			try {
				po_num = Integer.parseInt(request.getParameter("po_num"));
			}catch (Exception e) {
				e.printStackTrace();
			}
			res = postService.updateTmpPost(tmpPost, po_num);
		}
		
		//정상적으로 작동이 됐다면 ajax에 po_num 저장
		JSONObject jobj = new JSONObject();
		jobj.put("po_num", po_num);
		jobj.put("res", res?"OK":"");
	
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
		
		
	}

}
