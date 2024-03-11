package kr.kh.team3.app.service;

import java.io.IOException;
import java.io.InputStream;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team3.app.dao.MemberDAO;
import kr.kh.team3.app.model.vo.MemberVO;

public class MemberServiceImp implements MemberService {

private MemberDAO memberDao;
	
	public MemberServiceImp() {
		String resource = "kr/kh/team3/app/config/mybatis-config.xml";
		
		try {
			InputStream inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			SqlSession session = sessionFactory.openSession(true);
			memberDao = session.getMapper(MemberDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public boolean signup(MemberVO memberVO) {
		if(memberVO == null ||
			memberVO.getMe_name() == null ||
			memberVO.getMe_id() == null ||
			memberVO.getMe_pw() == null ||
			memberVO.getMe_email() == null ||
			memberVO.getMe_phone() == null) {
			return false;
		}
		// 정규표현식 체크 : to do..
		
		try {
			//아이디가 중복되면 예외가 발생
			return memberDao.insertMember(memberVO);
		}catch(Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}
}
