package kr.kh.team3.app.service;

import java.util.ArrayList;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.model.vo.PostVO;

public interface BoardService {

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<BoardVO> getBoardList();

	ArrayList<PostVO> getPostList(int boNum);

	ArrayList<PostVO> getRecentNotice();

}
