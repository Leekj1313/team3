package kr.kh.team3.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CategoryVO {
	private int ca_num;
	private String ca_name;
	
	public CategoryVO(int num, String name) {
		this.ca_num = num;
		this.ca_name = name;
	}
	
}