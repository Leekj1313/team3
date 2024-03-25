
package kr.kh.team3.app.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.kh.team3.app.model.vo.ReportVO;
import kr.kh.team3.app.pagination.PageMaker;
import kr.kh.team3.app.pagination.ReportCriteria;
import kr.kh.team3.app.service.PostService;
import kr.kh.team3.app.service.PostServiceImp;

@WebServlet("/report/list")
public class ReportPostListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private PostService postService = new PostServiceImp();
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		int page = 1;
		int poNum = 0;
		try {
			page = Integer.parseInt(request.getParameter("page"));
			poNum = Integer.parseInt(request.getParameter("poNum"));
		}catch(Exception e) {
			e.printStackTrace();
		}

		ReportCriteria cri = new ReportCriteria(page, 2, poNum);
		
		int totalCount = postService.getTotalCountReport(cri);
		PageMaker pm = new PageMaker(5, cri, totalCount);
		request.setAttribute("pm", pm);
		
		ArrayList<ReportVO> list = postService.getReportPostList(cri);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/WEB-INF/view/post/reportList.jsp").forward(request, response);
	}

}
