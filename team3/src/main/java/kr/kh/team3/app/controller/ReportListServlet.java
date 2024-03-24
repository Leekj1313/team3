package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.ReportVO;
import kr.kh.team3.app.pagination.Criteria;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.service.ReportService;
import kr.kh.team3.app.service.ReportServiceImp;

@WebServlet("/report/list")
public class ReportListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReportService reportService = new ReportServiceImp();
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
		request.getRequestDispatcher("/WEB-INF/view/report/list.jsp").forward(request, response);
	}
}