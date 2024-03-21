package kr.kh.team3.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {
	private int re_num; 
	private String re_me_id;
	private String re_rt_name;
	private int re_po_num; 
	private String re_table;
	private String re_content;
	private String re_state;
	private String re_title;
}
