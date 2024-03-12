package kr.kh.team3.app.dao;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.MemberVO;

public interface MemberDAO {

	boolean insertMember(@Param("member")MemberVO memberVO);

	MemberVO selectMember(@Param("me_id")String id);

}
