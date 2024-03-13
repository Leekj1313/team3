package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.CategoryVO;

public interface BoardDAO {

	ArrayList<CategoryVO> selectCategoryList();

	ArrayList<BoardVO> selectBoardList();

	boolean insertBoard(@Param("board")BoardVO board);

}
