package kr.kh.team3.app.model.vo;

import java.util.Date;

import kr.kh.team3.app.model.vo.MemberVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MemberVO {
	private String me_id;
	private String me_ms_state;
	private String me_pw;
	private String me_email;
	private String me_name;
	private String me_phone;
	private String me_authority; 
	private int me_fail_count;
	private Date me_stop;
	
	public MemberVO(String uname, String id, String pw, String email, String phone) {
		me_name = uname;
		me_id = id;
		me_pw = pw;
		me_email = email;
		me_phone = phone;
	}
}
