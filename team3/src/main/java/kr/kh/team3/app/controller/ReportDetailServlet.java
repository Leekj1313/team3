package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.ReportVO;
import kr.kh.team3.app.service.ReportService;
import kr.kh.team3.app.service.ReportServiceImp;


@WebServlet("/repotr/detail")
public class ReportDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ReportService reportService = new ReportServiceImp();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		int num;
		try {
			num = Integer.parseInt(request.getParameter("num"));
		}catch(Exception e) {
			num = 0;
		}
		ReportVO report = reportService.getReport(num);
		request.setAttribute("report", report);
		
		request.getRequestDispatcher("/WEB-INF/view/post/detail.jsp").forward(request, response);
		
	}

}
