package kr.kh.team3.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentCriteria extends Criteria{
	
	private int poNum;
	
	private String meId;

	public CommentCriteria(int page, int perPageNum, int poNum) {	
		super(page, perPageNum);
		this.poNum = poNum;
	}

	public CommentCriteria(int page, int i, int poNum, String me_id) {
		this.me_id = me_id;
	}
}
