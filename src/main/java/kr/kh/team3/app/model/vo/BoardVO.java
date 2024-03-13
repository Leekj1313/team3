package kr.kh.team3.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardVO {
	private int bo_num;
	private int bo_ca_num;
	private String bo_name;
	
	public BoardVO(String title, int ca_num) {
		this.bo_name = title;
		this.bo_ca_num = ca_num;
	}
}
