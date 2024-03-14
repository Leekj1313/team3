package kr.kh.team3.app.service;

import java.util.ArrayList;

import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.pagination.Criteria;

public interface PostService {

	int recommend(int po_num, int state, MemberVO user);

	int getTotalCount(Criteria cri);

	ArrayList<PostVO> getPostList(Criteria cri);

}
