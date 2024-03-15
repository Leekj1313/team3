package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.FileVO;
import kr.kh.team3.app.model.vo.PostVO;

public interface PostDAO {
	//게시글 리스트 불러오기
	ArrayList<PostVO> selectPostList();
	//게시글 작성
	boolean insertPost(@Param("post")PostVO post);
	//게시판 리스트 불러오기
	ArrayList<PostVO> selectBoardList();
	//게시글 번호를 통해 게시글 불러옴
	PostVO selectPost(@Param("num") int po_num);
	//첨부파일 번호를 통해 파일 가져오기
	ArrayList<FileVO> selectFileList(int num);
	FileVO selectFile(int num);
	boolean updatePost(PostVO post);
	void deleteFile(int fi_num);
	void insertFile(FileVO fileVo);
	boolean updateView(int num);
	
	


}
