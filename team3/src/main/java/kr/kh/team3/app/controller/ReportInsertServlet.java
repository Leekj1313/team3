package kr.kh.team3.app.controller;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.ReportVO;
import kr.kh.team3.app.service.ReportService;
import kr.kh.team3.app.service.ReportServiceImp;

@WebServlet("/report/insert")
public class ReportInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private ReportService reportService = new ReportServiceImp();
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
    	
    	request.getRequestDispatcher("/WEB-INF/view/report/insert.jsp").forward(request, response);
	}

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	MemberVO user = (MemberVO)request.getSession().getAttribute("user");
    	
    	String reportType = request.getParameter("reportType");
    	String reportTitle = request.getParameter("title");
    	String reportContent = request.getParameter("content");
    	int po_num = Integer.parseInt(request.getParameter("po_num"));
    	String writer = user.getMe_id();
    	String reportState = request.getParameter("re_state");
    	//신고 종류, 신고 제목, 신고 내용, 신고자, 신고 게시글 번호,신고처분을 이용하여 객체를 생성
		ReportVO report = new ReportVO(reportType, reportTitle, reportContent, writer, po_num, reportState);
		
		boolean res = reportService.insertReport(report);
		
		if(res) {
			request.setAttribute("msg", "게시글을 신고했습니다.");
		}else {
			request.setAttribute("msg", "게시글 신고에 실패했습니다.");
		}
		request.setAttribute("url", "report/list");
		request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
				
	}

}