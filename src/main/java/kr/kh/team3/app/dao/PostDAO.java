package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.model.vo.RecommendVO;
import kr.kh.team3.app.pagination.Criteria;

public interface PostDAO {

	RecommendVO selectRecommend(String me_id, int po_num);

	void insertRecommend(RecommendVO recommend);

	void updateRecommend(RecommendVO recommend);

	int selectTotalCount(@Param("cri")Criteria cri);

	ArrayList<PostVO> selectPostList(@Param("cri")Criteria cri);

}
