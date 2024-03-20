package kr.kh.team3.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team3.app.dao.ReportDAO;
import kr.kh.team3.app.model.vo.ReportVO;
import kr.kh.team3.app.pagination.Criteria;

public class ReportServiceImp implements ReportService{
	
	private ReportDAO reportDao;
	
	public ReportServiceImp() {
		String resource = "kr/kh/app/config/mybatis-config.xml";
		InputStream inputStream;
		SqlSession session;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			reportDao = session.getMapper(ReportDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<ReportVO> getReportList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return reportDao.selectReportList(cri);
	}

	@Override
	public boolean insertReport(ReportVO report) {
		if( report == null ||
			!checkString(report.getRe_title()) ||
			!checkString(report.getRe_content())) {
			return false;
		}
		boolean res = reportDao.insertReport(report);
		
		if(!res) {
			return false;
		}
		return true;
	}

	public boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public int getTotalCount(Criteria cri) {
		if(cri == null) {
			return 0;	
		}
		return reportDao.selectTotalReportCount(cri);
	}
	
	@Override
	public ReportVO getReport(int num) {
		return reportDao.selectReport(num);
	}
	

}
