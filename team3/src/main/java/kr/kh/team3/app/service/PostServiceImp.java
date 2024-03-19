package kr.kh.team3.app.service;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import javax.servlet.http.Part;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import kr.kh.team3.app.dao.PostDAO;
import kr.kh.team3.app.model.vo.FileVO;
import kr.kh.team3.app.model.vo.PostVO;
import kr.kh.team3.app.utils.FileUploadUtils;

public class PostServiceImp implements PostService{
	
	private static final String uploadPath = null;
	private PostDAO postDao;
	
	public PostServiceImp() {
		String resource = "kr/kh/team3/app/config/mybatis-config.xml";
		InputStream inputStream;
		SqlSession session;
		try {
			inputStream = Resources.getResourceAsStream(resource);
			SqlSessionFactory sessionFactory = new SqlSessionFactoryBuilder().build(inputStream);
			session = sessionFactory.openSession(true);
			postDao = session.getMapper(PostDAO.class);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public ArrayList<PostVO> getPostList() {
		return postDao.selectPostList();
	}
	
	@Override
	public ArrayList<PostVO> getBoardList() {
		return postDao.selectBoardList();
	}

	@Override
	public boolean insertPost(PostVO post, ArrayList<Part> partList) {
		
		//게시글 null 체크
		if( post == null ||
			!checkString(post.getPo_title()) ||
			!checkString(post.getPo_content())) {
			return false;
		}
		//첨부파일이 없을 때
		if(partList == null || partList.size() == 0) {
			return true;
		}
		//회원 null 체크
		/*
		if(user == null) {
			return false;
		}*/
		return postDao.insertPost(post);
	}

	private boolean checkString(String str) {
		//게시글을 작성할 때 제목과 내용이 빈 내용일 때 
		if(str == null || str.length() == 0) {
			return false;
		}
		return true;
	}
	
	@Override
	public PostVO getPost(int num) {
		return postDao.selectPost(num);
	}

	@Override
	public ArrayList<FileVO> getFileList(int num) {
		// TODO Auto-generated method stub
		return postDao.selectFileList(num);
	}

	@Override
	public boolean updatePost(PostVO post, String[] nums, ArrayList<Part> partList) {
		//게시글 null 체크
		if( post == null || 
			!checkString(post.getPo_title()) || 
			!checkString(post.getPo_content())) {
			return false;
		}
		//게시글 번호를 이용하여 게시글을 가져옴 
		PostVO dbPost = postDao.selectPost(post.getPo_num());
		//게시글이 없거나 게시글 작성자가 회원이 아니면 false를 리턴
	
		/*if(dbPost == null || !dbPost.getPo_me_id().equals(user.getMe_id())) {
			return false;
		}*/
		if(dbPost == null) {
		if(nums != null) {
			//삭제할 첨부파일 삭제
			for(String numStr : nums) {
				try {
					int num = Integer.parseInt(numStr);
					FileVO fileVo = postDao.selectFile(num);
					deleteFile(fileVo);
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		//추가할 첨부파일 추가
		for(Part part : partList) {
			uploadFile(part, post.getPo_num());
		}
		
		//서비스에게 게시글을 주면서 수정하라고 요청
		return postDao.updatePost(post);
		}
	}

	private void uploadFile(Part part, int po_num) {
		//첨부파일이 null이거나 게시글 번호가 null이면
		if(part == null || po_num == 0) {
			return;
		}
		//서버에 업로드
		String fileOriginalName = FileUploadUtils.getFileName(part);
		if(!checkString(fileOriginalName)) {
			return;
		}
		String fileName = FileUploadUtils.upload(uploadPath, part);
		//DB에 추가
		FileVO fileVo =new FileVO(po_num, fileName, fileOriginalName);
		postDao.insertFile(fileVo);
	}
	
	private void deleteFile(FileVO file) {
		if(file == null) {
			return;
		}
		String fileName = uploadPath + 
				file.getFi_name().replace('/', File.separatorChar);
		//서버에서 실제 파일을 삭제
		FileUploadUtils.deleteFile(fileName);
		postDao.deleteFile(file.getFi_num());
		
	}

	@Override
	public boolean deletePost(int num) {
		/*
		if(user == null) {
			return false;
		}*/
		//게시글을 가져옴
		PostVO post = postDao.selectPost(num);
		//게시글이 없거나 작성자가 아니면 false를 리턴
		/*
		if(post == null || !post.getPo_me_id().equals(user.getMe_id())) {
			return false;
		}*/
		if(post == null) {
			return false;
		}
		//첨부파일을 삭제if(user == null) {
			return false;
		}
		//게시글을 가져옴
		//PostVO post = postDao.selectPost(num);
		//게시글이 없거나 작성자가 아니면 false를 리턴
		/*
		if(post == null || !post.getBo_me_id().equals(user.getMe_id())) {
			return false;
		}*/
		/*
		//첨부파일을 삭제
		//게시글 번호에 맞는 첨부파일을 가져오라고 시킴
		ArrayList<FileVO> fileList = postDao.selectFileList(num);
		for(FileVO file : fileList) {
			deleteFile(file);
		}
		
		//게시글을 삭제 요청
		return boardDao.deleteBoard(num);
		}
		//게시글 번호에 맞는 첨부파일을 가져오라고 시킴
		ArrayList<FileVO> fileList = postDao.selectFileList(num);
		for(FileVO file : fileList) {
			deleteFile(file);
		}
		
		//게시글을 삭제 요청
		return postDao.deletePost(num);
	}*/
		@Override
		public boolean updateView(int num) {
			//조회수 추가
			return postDao.updateView(num);
		}
}
