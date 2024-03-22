package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.ReportVO;
import kr.kh.team3.app.pagination.Criteria;

public interface ReportDAO {

	ArrayList<ReportVO> selectReportList(@Param("cri")Criteria cri);

	boolean insertReport(@Param("report")ReportVO report);

	int selectTotalReportCount(@Param("cri")Criteria cri);

	ReportVO selectReport(@Param("num")int num);

}
