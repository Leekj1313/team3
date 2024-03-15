package kr.kh.team3.app.pagination;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class BoardCriteria extends Criteria{
	
	private int caNum;

	public BoardCriteria(int page, int perPageNum, int caNum) {	
		super(page, perPageNum);
		this.caNum = caNum;
	}
}

