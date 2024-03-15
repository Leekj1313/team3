package kr.kh.team3.app.service;

import java.util.ArrayList;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.CategoryVO;

public interface BoardService {

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<BoardVO> getBoardList();

	boolean insertBoard(BoardVO board);

	BoardVO getBorad(int boNum);

}
