package kr.kh.team3.app.service;

import java.util.ArrayList;

import kr.kh.team3.app.model.vo.ReportVO;
import kr.kh.team3.app.pagination.Criteria;

public interface ReportService {

	ArrayList<ReportVO> getReportList(Criteria cri);

	boolean insertReport(ReportVO report);

	int getTotalCount(Criteria cri);

	ReportVO getReport(int num);

}
