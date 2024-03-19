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

import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.pagination.Criteria;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.service.CategoryService;
import kr.kh.team3.app.service.CategoryServiceImp;
import kr.kh.team3.app.service.MemberService;
import kr.kh.team3.app.service.MemberServiceImp;

@WebServlet("/admin/membermanager")
public class MemberManagerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService = new CategoryServiceImp();
	private MemberService memberService = new MemberServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/admin/membermanager.jsp").forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int page = 1;
		try {
			page = Integer.parseInt(request.getParameter("page"));
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		Criteria cri = new Criteria(page, 2);
		ArrayList<CategoryVO> list = memberService.getMemberList(cri);
		
		int totalCount = memberService.getTotalCountMember(cri);

		//페이지네이션 생성
		PageMaker pm = new PageMaker(5, cri, totalCount);
		
		//화면에 list를 전송(객체로)
		JSONObject jobj = new JSONObject();
		
		//화면에 pm을 전송(JSON 문자열로)
		ObjectMapper om = new ObjectMapper();
		String pmStr = "";
		try {
			//객체를 JSON형태의 문자열로 변환
			pmStr = om.writeValueAsString(pm);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		jobj.put("list", list);
		jobj.put("pm", pmStr);
		response.setContentType("application/json; charset=utf-8");
		response.getWriter().print(jobj);
	}

}
