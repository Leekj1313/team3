package kr.kh.team3.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RecommendVO {
	private int rc_num;
	private int rc_po_num;
	private String rc_me_id;
	private String rc_state;
}
