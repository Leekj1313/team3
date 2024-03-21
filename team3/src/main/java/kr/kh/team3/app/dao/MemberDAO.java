package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO memberVO);

	MemberVO selectMember(@Param("me_id")String id);

	boolean updateMember(@Param("member")MemberVO user);

	boolean deleteMember(@Param("me_id")String me_id);

	ArrayList<MemberVO> selectMemberList();



}