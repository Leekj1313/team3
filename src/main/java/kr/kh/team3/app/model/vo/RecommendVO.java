package kr.kh.team3.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class RecommendVO {
	private int rc_num;
	private int rc_po_num;
	private String rc_me_id;
	private int rc_state;

	public RecommendVO(String me_id, int po_num, int state) {
		this.rc_me_id = me_id;
		this.rc_po_num = po_num;
		this.rc_state = state;
	}
}
