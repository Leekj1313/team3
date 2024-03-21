package kr.kh.team3.app.pagination;

public class ReportCriteria extends Criteria{
	
	private int poNum;
	
	
	public ReportCriteria(int page, int perPageNum, int poNum) {	
		super(page, perPageNum);
		this.poNum = poNum;
	}
	
}
