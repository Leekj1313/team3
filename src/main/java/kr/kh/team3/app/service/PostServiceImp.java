package kr.kh.team3.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team3.app.dao.PostDAO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.model.vo.RecommendVO;
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
}
