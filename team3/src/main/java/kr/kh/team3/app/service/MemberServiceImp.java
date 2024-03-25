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
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.pagination.Criteria;

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
	public MemberVO getMemberId(String name, String phone) {
		if(name == null || phone == null) {
			return null;
		}
		return memberDao.selectMemberId(name, phone);
	}
	
	@Override
	public MemberVO getMemberPw(String id, String phone) {
		if(id == null || phone == null) {
			return null;
		}
		return memberDao.selectMemberPw(id, phone);
	}

	@Override
	public MemberVO getMember(String id) {
		if(id == null) {
			return null;
		}
		return memberDao.selectMember(id);
	}

	@Override
	public boolean updatePassword(String pw, String id) {
		if(pw == null || id == null) {
			return false;
		}
		
		MemberVO user = memberDao.selectMember(id);
		if(user == null) {
			return false;
		}
		return memberDao.updatePassword(pw, user);
	}

	@Override
	public void failCountUp(MemberVO failUser, int failCount) {
		memberDao.updateFailCount(failUser.getMe_id(), failCount);
	}

	@Override
	public void updateMemberState(MemberVO failUser, String state) {
		memberDao.updateMemberState(failUser.getMe_id(), state);
	}
	
	public ArrayList<MemberVO> getMemberList(Criteria cri) {
		if(cri == null) {
			cri = new Criteria(1, 2);
		}
		return memberDao.selectMemberList(cri);
	}

	@Override
	public int getTotalCountMember(Criteria cri) {
		if(cri == null) {
			return 0;
		}
		return memberDao.selectTotalCountMember(cri);
	}
	
	@Override
	public boolean updateMemberAuthority(MemberVO user) {
		if(user == null) {
			return false;
		}
		return memberDao.updateMemberAuthority(user);
	}

	@Override
	public boolean deleteMember(String me_id) {
		MemberVO user = memberDao.selectMember(me_id);
		return memberDao.deleteMember(me_id);
	}



	private boolean checkString(String str) {
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}

	@Override
	public boolean updateMemberName(MemberVO user, String newName) {
		
		MemberVO dbMember = memberDao.selectMember(user.getMe_id());
		if(dbMember == null) {
			return false;
		}
		if(!checkString(newName)) {
			return false;
		}
		if(dbMember.getMe_name().equals(newName)) {
			return false;
		}
		
		return memberDao.updateMemberName(newName, user);
	}

	@Override
	public boolean updateMemberEmail(MemberVO user, String newEmail) {
		MemberVO dbMember = memberDao.selectMember(user.getMe_id());
		if(dbMember == null) {
			return false;
		}
		if(!checkString(newEmail)) {
			return false;
		}
		if(dbMember.getMe_email().equals(newEmail)) {
			return false;
		}
		return memberDao.updateMemberEmail(newEmail, user);
	}

	@Override
	public boolean updateMemberPhone(MemberVO user, String newPhone) {
		MemberVO dbMember = memberDao.selectMember(user.getMe_id());
		if(dbMember == null) {
			return false;
		}
		if(!checkString(newPhone)) {
			return false;
		}
		if(dbMember.getMe_phone().equals(newPhone)) {
			return false;
		}
		
		return memberDao.updateMemberPhone(newPhone, user);
	}

	
	
}