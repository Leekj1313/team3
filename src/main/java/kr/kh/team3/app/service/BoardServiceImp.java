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
}
