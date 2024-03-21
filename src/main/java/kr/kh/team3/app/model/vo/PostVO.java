package kr.kh.team3.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class PostVO {
	private int po_num;
	private int po_bo_num; 
	private String po_me_id;
	private String po_title; 
	private String po_content; 
	private int po_view; 
	private Date po_date;
	private int po_report_count;
	private int po_temp; 
	private int po_notice;
	private BoardVO board;
	private int po_up;
	
	public PostVO(int num, String title, String content, int boNum) {
		this.po_num = num;
		this.po_title = title;
		this.po_content = content;
		this.po_bo_num = boNum;
	}

	public PostVO(int bo_num, String title, String content, String writer) {
		this.po_bo_num = bo_num;
		this.po_title = title;
		this.po_content = content;
		this.po_me_id = writer;
	}
}
