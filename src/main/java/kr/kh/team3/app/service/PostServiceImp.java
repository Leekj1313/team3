package kr.kh.team3.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team3.app.dao.PostDAO;
import kr.kh.team3.app.model.vo.CommentVO;
import kr.kh.team3.app.model.vo.FileVO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.MyCommentVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.model.vo.RecommendVO;
import kr.kh.team3.app.pagination.CommentCriteria;
import kr.kh.team3.app.pagination.Criteria;

public class PostServiceImp implements PostService {
	
	private PostDAO postDao;
	
	public PostServiceImp() {
		String resource = "kr/kh/team3/app/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			postDao = session.getMapper(PostDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public int recommend(int po_num, int state, MemberVO user) {
		if(user == null) {
			throw new RuntimeException();
		}
		//게시글 번호와 아이디를 주면서 추천 정보를 가져오라고 함
		RecommendVO recommend = postDao.selectRecommend(user.getMe_id(), po_num);
		//없으면 추가
		if(recommend == null) {
			recommend = new RecommendVO(user.getMe_id(), po_num, state);
			postDao.insertRecommend(recommend);
			return state;
		}
		//있으면 수정
		else {
			//기존 추천 상태와 state가 같으면 취소(0으로 변경)
			if(state == recommend.getRc_state()) {
				recommend.setRc_state(0);
			}
			//다르면 state로 변경
			else {
				recommend.setRc_state(state);
			}
			postDao.updateRecommend(recommend);
			return recommend.getRc_state();
		}	}



	@Override
	public boolean updateView(int num) {
		return postDao.updateView(num);
	}

	@Override
	public PostVO getPost(int num) {
		return postDao.selectPost(num);
	}

	@Override
	public ArrayList<FileVO> getFile(int num) {
		return postDao.selectFileByBo_num(num);
	}

	@Override
	public RecommendVO getRecommend(MemberVO user, int num) {
		if(user == null) {
			return null;
		}
		return postDao.selectRecommend(user.getMe_id(), num);
	}

	@Override
	public boolean insertComment(CommentVO comment) {
		if( comment == null || 
				!checkString(comment.getCm_content())) {
				return false;
			}
			return postDao.insertComment(comment);
	}

	private boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public ArrayList<CommentVO> getCommentList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(1,2);
		}
		return postDao.selectCommentList(cri);
	}

	@Override
	public int getTotalCountComment(Criteria cri) {
		if(cri == null) {
			return 0;
		}
		return postDao.selectTotalCountComment(cri);
	}

	@Override
	public boolean updateComment(CommentVO comment) {
		if( comment == null ||
				!checkString(comment.getCm_content()) || 
				!checkString(comment.getCm_me_id())) {
				return false;
			}
			
			CommentVO dbComment = postDao.selectComment(comment.getCm_num());
			
			if( dbComment == null || 
				!dbComment.getCm_me_id().equals(comment.getCm_me_id())) {
				return false;
			}
			
			return postDao.updateComment(comment);
	}

	@Override
	public boolean deleteComment(int num, MemberVO user) {
		if(user == null) {
			return false;
		}
		//댓글 번호와 일치하는 댓글을 가져옴
		CommentVO comment = postDao.selectComment(num);
		//댓글 작성자가 회원인지 확인하여 아니면 false 리턴
		if( comment == null || 
			!comment.getCm_me_id().equals(user.getMe_id())) {
			return false;
		}
		//맞으면 삭제 요청
		
		return postDao.deleteComment(num);
	}

	@Override
	public ArrayList<PostVO> getPostList(int boNum) {
		return postDao.selectPostList(boNum);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return postDao.selectTotalCount(cri);
	}

	@Override
	public ArrayList<PostVO> getPostList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return postDao.selectPostList(cri);
	}
	
	@Override
	public ArrayList<PostVO> getRecentNotice() {
		return postDao.selectRecentNotice();
		
	}

	@Override
	public ArrayList<PostVO> getMyPostList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return postDao.selectMyPostList(cri);
	}

	@Override
	public int getMyPostTotalCount(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return postDao.selectMyPostTotalCount(cri);
	}

	@Override
	public ArrayList<MyCommentVO> getMyCommentPostList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return postDao.selectMyCommentPostList(cri);
	}

	@Override
	public int getMyCommentPostTotalCount(Criteria cri) {
		if(cri == null) {
			cri = new Criteria();
		}
		return postDao.selectMyCommentPostTotalCount(cri);
	}

//	@Override
//	public ArrayList<CommentVO> getMyCommentList(String me_id) {
//		if(me_id == null) {
//			return null;
//		}
//		return postDao.selectMyCommentList(me_id);
//	}


}
