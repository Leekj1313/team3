package kr.kh.team3.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team3.app.dao.CategoryDAO;
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.pagination.Criteria;

public class CategoryServiceImp implements CategoryService {
	private CategoryDAO categoryDao;
	
	public CategoryServiceImp() {
		String resource = "kr/kh/team3/app/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			categoryDao = session.getMapper(CategoryDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<CategoryVO> getCategoryList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(1, 2);
		}
		return categoryDao.selectCategoryList(cri);
	}

	@Override
	public int getTotalCountCategory(Criteria cri) {
		if(cri == null) {
			return 0;
		}
		return categoryDao.selectTotalCountCategory(cri);
	}
}