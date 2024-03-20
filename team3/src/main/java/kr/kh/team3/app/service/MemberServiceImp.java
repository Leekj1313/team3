package kr.kh.team3.app.service;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team3.app.dao.MemberDAO;
import kr.kh.team3.app.model.dto.LoginDTO;
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
	
	@Override
	public MemberVO login(LoginDTO loginDTO) {
		if(loginDTO == null) {
			return null;
		}
		//아이디를 주고 회원 정보를 요청
		MemberVO user = memberDao.selectMember(loginDTO.getId());
		
		//아이디를 잘못 입력하면
		if(user == null) {
			return null;
		}
		//비번이 같은지 확인
		if(user.getMe_pw().equals(loginDTO.getPw())) {
			return user;
		}
		
		return null;
	}
	
	@Override
	public boolean checkId(String id) {
		MemberVO member = memberDao.selectMember(id);
		return member == null;
	}

	@Override
	public ArrayList<MemberVO> getMemberList() {
		return memberDao.selectMemberList();
	}

	@Override
	public boolean updateMember(MemberVO member) {
		if( member == null ||
			!checkString(member.getMe_email()) || 
			!checkString(member.getMe_phone())) {
			return false;
		}
		return memberDao.updateMember(member);	
	}
	
	public boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public boolean deleteMember(MemberVO user) {
		return memberDao.deleteMember(user);
	}
}