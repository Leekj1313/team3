package kr.kh.team3.app.pagination;

import kr.kh.team3.app.model.vo.MemberVO;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class Criteria {

	private int page = 1;//현재 페이지 : 기본값 - 1
	private int perPageNum = 10;//한 페이지에서 컨텐츠 개수 : 기본값 - 10
	private int boNum;
	private String me_id;
	private String me_authority;
	private MemberVO user;
	private String search = ""; //검색어 : 기본값 - 빈문자열=> 전체 검색

	private String type = "all"; //검색 타입 : 기본값 - 전체검색
	
	public Criteria(int page) {
		this.page = page;
	}
	public Criteria(int page, int perPageNum) {
		this.page = page;
		this.perPageNum = perPageNum;
	}
	public Criteria(int page, int perPageNum, String type, String search) {
		this(page, perPageNum);
		this.type = type == null ? "" : type;
		this.search = search == null ? "" : search;
	}
	public int getPageStart() {
		return (page - 1) * perPageNum;
	}
	
	public Criteria(int page, int perPageNum, String type, String search, int boNum) {
		this(page, perPageNum);
		this.type = type == null ? "" : type;
		this.search = search == null ? "" : search;
		this.boNum = boNum;
	}
	public Criteria(int page, int perPageNum, String type, String search, String user) {
		this(page, perPageNum);
		this.type = type == null ? "" : type;
		this.search = search == null ? "" : search;
		this.me_id = user;
	}
	public Criteria(int page, int perPageNum, String type, String search, MemberVO user) {
		this(page, perPageNum);
		this.type = type == null ? "" : type;
		this.search = search == null ? "" : search;
		this.user = user;
	}
	public Criteria(int page, int perPageNum, String type, String search, String user, String me_authority) {
		this(page, perPageNum);
		this.type = type == null ? "" : type;
		this.search = search == null ? "" : search;
		this.me_id = user;
		this.me_authority = me_authority;
	}

}
