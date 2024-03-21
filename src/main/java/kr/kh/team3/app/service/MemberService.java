package kr.kh.team3.app.service;

import java.util.ArrayList;

import kr.kh.team3.app.model.dto.LoginDTO;
import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.model.vo.MemberVO;
import kr.kh.team3.app.pagination.Criteria;

public interface MemberService {

	boolean signup(MemberVO memberVO);

	boolean checkId(String id);

	MemberVO login(LoginDTO loginDTO);

	MemberVO getMemberId(String name, String phone);

	MemberVO getMemberPw(String id, String phone);

	MemberVO getMember(String id);

	boolean updatePassword(String pw, String id);

	ArrayList<MemberVO> getMemberList(Criteria cri);

	int getTotalCountMember(Criteria cri);

	boolean deleteMember(String me_id);

	boolean updateMemberAuthority(MemberVO user);

}