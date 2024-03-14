package kr.kh.team3.app.service;

import java.util.ArrayList;

import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.pagination.Criteria;

public interface BoardService {

	ArrayList<CategoryVO> getCategoryList();

	ArrayList<BoardVO> getBoardList();

	ArrayList<PostVO> getPostList(int boNum);

	int getTotalCount(Criteria cri);

	ArrayList<PostVO> getTestPost();

	ArrayList<PostVO> getRecentNotice();

}
