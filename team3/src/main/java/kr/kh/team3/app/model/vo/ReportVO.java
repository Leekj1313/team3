package kr.kh.team3.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class ReportVO {
	
	private int re_num; 
	private String re_me_id;
	private String re_rt_name; 
	private String re_title;
	private String re_content;
	private String re_state;
	private int re_po_num;
	
	public ReportVO(String reportType, String reportContent, int po_num) {
		this.re_rt_name = reportType;
		this.re_content = reportContent;
		this.re_po_num = po_num;
	}
}
