package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO memberVO);

	MemberVO selectMember(@Param("me_id")String id);

	MemberVO selectMemberId(@Param("me_name")String name, @Param("me_phone")String phone);

	MemberVO selectMemberPw(@Param("me_id")String id, @Param("me_phone")String phone);

	boolean updatePassword(@Param("me_pw")String pw, @Param("user")MemberVO user);

}