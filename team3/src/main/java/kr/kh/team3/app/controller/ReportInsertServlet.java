package kr.kh.team3.app.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.PostVO;
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
    	//화면에서 보낸 신고 타입과 신고 내용, 게시글 번호를 가져옴 
    	String reportType = request.getParameter("reportType");
    	String reportContent = request.getParameter("content");
    	int po_num = 0;
    	try {
    		po_num = Integer.parseInt(request.getParameter("num"));
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
		//신고하는 게시글을 가져옴
    	PostVO post = (PostVO)request.getSession().getAttribute("post");
    	if (post == null) {
	        request.setAttribute("msg", "게시글을 가져올 수 없습니다.");
	        request.getRequestDispatcher("/WEB-INF/view/message.jsp").forward(request, response);
	        return;
	    }
		//게시글 신고 등록 해당 게시글 번호로 등록 => 신고유형, 신고내용
    	ReportVO report = new ReportVO(reportType, reportContent, post.getPo_num());
		
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