package kr.kh.team3.app.service;

import java.util.ArrayList;

import javax.servlet.http.Part;

import kr.kh.team3.app.model.vo.CommentVO;
import kr.kh.team3.app.model.vo.FileVO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.MyCommentVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.model.vo.RecommendVO;
import kr.kh.team3.app.model.vo.ReportVO;
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
	
	ArrayList<PostVO> getRecentNotice();
  
	ArrayList<PostVO> getPostHotList();

	boolean deletePost(int num, MemberVO user);
  
	ArrayList<PostVO> getMyPostList(Criteria cri);

	int getMyPostTotalCount(Criteria cri);

	ArrayList<MyCommentVO> getMyCommentPostList(Criteria cri);

	int getMyCommentPostTotalCount(Criteria cri);

	boolean insertPost(PostVO post, ArrayList<Part> partList);

	int insertTmpPost(PostVO tmpPost);

	boolean updateTmpPost(PostVO tmpPost, int po_num);

	ArrayList<PostVO> getTmpPostList(MemberVO user);

	boolean submitTmpPost(PostVO post, int po_num, ArrayList<Part> partList);

	boolean updatePost(PostVO post, MemberVO user, ArrayList<Integer> nums, ArrayList<Part> fileList);

	ArrayList<ReportVO> getReportPostList(Criteria cri);

	int getTotalCountReport(Criteria cri);

	boolean deleteReportPost(int num, MemberVO user);

}