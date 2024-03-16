package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.service.CategoryService;
import kr.kh.team3.app.service.CategoryServiceImp;

@WebServlet("/category/insert")
public class CategoryInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private CategoryService categoryService = new CategoryServiceImp();
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		
//		//중복이면
//		boolean checkCat = categoryService.checkCat(category);
//		if(!checkCat) {
//			response.getWriter().write("dup");
//		}
		
		boolean res = categoryService.insertCategory(category);
    	response.getWriter().write(res?"ok":"");
	}

}
