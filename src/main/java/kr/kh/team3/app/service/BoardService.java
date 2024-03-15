package kr.kh.team3.app.service;

import java.util.ArrayList;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.pagination.BoardCriteria;
import kr.kh.team3.app.pagination.Criteria;

public interface BoardService {

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<BoardVO> getBoardList();

	boolean insertBoard(BoardVO board);

	BoardVO getBorad(int boNum);

	ArrayList<BoardVO> getBoardList(Criteria cri);

	int getTotalCountBoard(Criteria cri);

	CategoryVO getCategory(int caNum);

}
