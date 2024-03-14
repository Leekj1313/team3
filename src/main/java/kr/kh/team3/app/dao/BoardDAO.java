package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.pagination.Criteria;

public interface BoardDAO {

	ArrayList<CategoryVO> selectCategoryList();

	ArrayList<BoardVO> selectBoardList();

	ArrayList<PostVO> selectPostList(@Param("boNum")int boNum);

	int selectTotalCount(@Param("cri")Criteria cri);

	ArrayList<PostVO> selectTest();

	ArrayList<PostVO> selectRecentNotice();

}
