package kr.kh.team3.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team3.app.dao.BoardDAO;
import kr.kh.team3.app.model.vo.BoardVO;
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.pagination.Criteria;

public class BoardServiceImp implements BoardService{
	
	private BoardDAO boardDao;
	
	public BoardServiceImp() {
		String resource = "kr/kh/team3/app/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			boardDao = session.getMapper(BoardDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<CategoryVO> getCategoryList() {
		return boardDao.selectCategoryList();
	}

	@Override
	public ArrayList<BoardVO> getBoardList() {
		return boardDao.selectBoardList();
	}

	@Override
	public boolean insertBoard(BoardVO board) {
		if(board == null ||
				!checkString(board.getBo_name())) {
			return false;
		}
		boolean res = boardDao.insertBoard(board);
		
		if(!res) {
			return false;
		}
		return res;
	}
	
	private boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public BoardVO getBorad(int boNum) {
		return boardDao.selectBoard(boNum);
	}

	@Override
	public int deleteBoard(int num, MemberVO user) {
		
		
		if(user==null||
			!checkString(user.getMe_id())||
		    !user.getMe_authority().equals("ADMIN")) {
			return -2;
		}
		
		if(boardDao.deleteBoard(num)) {
			return 1;
		}
		return -1;
		
	}

	@Override
	public int updateBoard(int bo_num, String bo_name, MemberVO user) {
		BoardVO board = boardDao.selectBoard(bo_num);
		String ori_bo_name = board.getBo_name();
		
		if(!checkString(bo_name) || ori_bo_name.equals(bo_name) ) {
			return -1;
		}
		if( user==null||
			!user.getMe_authority().equals("ADMIN")) {
			return -2;
		}
		
		ArrayList<BoardVO> boardList = boardDao.selectBoardList();
		
		for(BoardVO item : boardList) {
			if(item.getBo_name().equals(bo_name)) {
				return -1;
			}
		}
		
		if(boardDao.updateBoard(bo_num,bo_name)) {
			return 1;
		}
		return -1;
		
	}

}
