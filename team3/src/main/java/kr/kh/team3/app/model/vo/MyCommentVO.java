package kr.kh.team3.app.model.vo;

import java.util.Date;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class MyCommentVO {
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
	private int cm_num;
	private int cm_po_num;
	private String cm_me_id;
	private String cm_content;
	private int bo_num;
	private int bo_ca_num;
	private String bo_name;
	private CategoryVO category;
}