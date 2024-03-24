package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.service.CategoryService;
import kr.kh.team3.app.service.CategoryServiceImp;

@WebServlet("/category/update")
public class CategoryUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService = new CategoryServiceImp();
 
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//화면에서 보낸 카테고리명과 번호를 가져옴
		int num = 0;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		} catch (Exception e) {
			e.printStackTrace();
		}
		String name = request.getParameter("name");

		CategoryVO category = new CategoryVO(0, name);
		category.setCa_num(num);
		
		System.out.println(category);
		boolean res = categoryService.updateCategory(category);
		response.getWriter().write(res ? "ok" : "");
		
	}

}
