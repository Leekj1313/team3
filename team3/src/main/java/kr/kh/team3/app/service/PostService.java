package kr.kh.team3.app.service;

import java.util.ArrayList;

import javax.servlet.http.Part;

import kr.kh.team3.app.model.vo.FileVO;
import kr.kh.team3.app.model.vo.PostVO;

public interface PostService {

	ArrayList<PostVO> getPostList();

	ArrayList<PostVO> getBoardList();

	boolean insertPost(PostVO post, ArrayList<Part> partList);

	PostVO getPost(int num);

	ArrayList<FileVO> getFileList(int num);

	boolean updatePost(PostVO post, String[] nums, ArrayList<Part> partList);

	boolean deletePost(int num);

	boolean updateView(int num);

}
