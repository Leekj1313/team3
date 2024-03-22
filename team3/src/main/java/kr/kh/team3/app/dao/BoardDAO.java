package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.pagination.Criteria;

public interface BoardDAO {

	ArrayList<CategoryVO> selectCategoryList();

	ArrayList<BoardVO> selectBoardList();

	boolean insertBoard(@Param("board")BoardVO board);

	BoardVO selectBoard(@Param("boNum")int boNum);

	boolean deleteBoard(@Param("boNum")int num);

	boolean updateBoard(@Param("boNum")int bo_num, @Param("bo_name")String bo_name);

}
