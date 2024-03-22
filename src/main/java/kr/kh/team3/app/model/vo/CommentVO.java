package kr.kh.team3.app.model.vo;

import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
public class CommentVO {
	private int cm_num; 
	private int cm_po_num; 
	private String cm_me_id; 
	private String cm_content;
	private PostVO post;

	public CommentVO(int po_num, String content, String meId) {
		cm_po_num = po_num;
		cm_content = content;
		cm_me_id = meId;
	}
}
