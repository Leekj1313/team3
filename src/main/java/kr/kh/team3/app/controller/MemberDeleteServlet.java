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

@WebServlet("/admin/memberdelete")
public class MemberDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService = new CategoryServiceImp();
	private MemberService memberService = new MemberServiceImp();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//삭제할 회원 아이디를 가져옴
		String me_id = request.getParameter("me_id");
		boolean res = memberService.deleteMember(me_id);
		response.getWriter().write(res ? "ok" : "");
	}

}
