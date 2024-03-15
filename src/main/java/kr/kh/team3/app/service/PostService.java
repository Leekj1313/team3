package kr.kh.team3.app.service;

import java.util.ArrayList;

import kr.kh.team3.app.model.vo.CommentVO;
import kr.kh.team3.app.model.vo.FileVO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.model.vo.RecommendVO;
import kr.kh.team3.app.pagination.CommentCriteria;
import kr.kh.team3.app.pagination.Criteria;

public interface PostService {

	int recommend(int po_num, int state, MemberVO user);


	boolean updateView(int num);

	PostVO getPost(int num);

	ArrayList<FileVO> getFile(int num);

	RecommendVO getRecommend(MemberVO user, int num);

	boolean insertComment(CommentVO comment);

	ArrayList<CommentVO> getCommentList(Criteria cri);

	int getTotalCountComment(Criteria cri);

	boolean updateComment(CommentVO comment);

	boolean deleteComment(int num, MemberVO user);

	ArrayList<PostVO> getPostList(int boNum);

	int getTotalCount(Criteria cri);

	ArrayList<PostVO> getPostList(Criteria cri);


}