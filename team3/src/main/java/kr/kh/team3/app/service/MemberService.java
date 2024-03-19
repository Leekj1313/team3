package kr.kh.team3.app.service;

import java.util.ArrayList;

import kr.kh.team3.app.model.dto.LoginDTO;
import kr.kh.team3.app.model.vo.MemberVO;

public interface MemberService {

	boolean signup(MemberVO memberVO);

	boolean checkId(String id);

	MemberVO login(LoginDTO loginDTO);

	ArrayList<MemberVO> getMemberList();

	boolean updateMember(MemberVO member);

	boolean deleteMember(String me_id);

}