package kr.kh.team3.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentCriteria extends Criteria{
	
	private int poNum;

	public CommentCriteria(int page, int perPageNum, int poNum) {	
		super(page, perPageNum);
		this.poNum = poNum;
	}

}
