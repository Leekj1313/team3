package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.pagination.BoardCriteria;
import kr.kh.team3.app.pagination.Criteria;

public interface BoardDAO {

	ArrayList<CategoryVO> selectCategoryList();

	ArrayList<BoardVO> selectBoardList();

	boolean insertBoard(@Param("board")BoardVO board);

	BoardVO selectBoard(@Param("boNum")int boNum);

	int selectTotalCount(@Param("cri")Criteria cri);

	ArrayList<BoardVO> selectBoList(@Param("cri")Criteria cri);

	int selectTotalCountBoard(@Param("cri")Criteria cri);

	CategoryVO selectCate(@Param("caNum")int caNum);

}
