package kr.kh.team3.app.model.dto;

import kr.kh.team3.app.model.dto.LoginDTO;
import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class LoginDTO {
	private String id;
	private String pw;
	
}