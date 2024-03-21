package kr.kh.team3.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class FileVO {
	private int fi_num;
	private int fi_po_num; 
	private String fi_name; 
	private String fi_ori_name;
	
	public FileVO(int po_num, String fileName, String fileOriginalName) {
		this.fi_po_num = po_num;
		this.fi_name = fileName;
		this.fi_ori_name = fileOriginalName;
	}
}
