package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.CommentVO;
import kr.kh.team3.app.model.vo.FileVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.model.vo.RecommendVO;
import kr.kh.team3.app.pagination.Criteria;

public interface PostDAO {

	RecommendVO selectRecommend(@Param("me_id")String me_id, @Param("po_num") int po_num);

	void insertRecommend(@Param("re")RecommendVO recommend);

	void updateRecommend(@Param("re")RecommendVO recommend);

	boolean updateView(@Param("num")int num);

	PostVO selectPost(@Param("num")int num);

	ArrayList<FileVO> selectFileByBo_num(@Param("num")int num);

	boolean insertComment(@Param("co")CommentVO comment);

	ArrayList<CommentVO> selectCommentList(@Param("cri")Criteria cri);

	int selectTotalCountComment(@Param("cri")Criteria cri);

	CommentVO selectComment(@Param("cm_num")int cm_num);

	boolean updateComment(@Param("co")CommentVO comment);

	boolean deleteComment(@Param("cm_num")int num);

	ArrayList<PostVO> selectPostList(@Param("boNum")int boNum);


}
