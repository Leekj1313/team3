package kr.kh.team3.app.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;

import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.pagination.Criteria;

public interface CategoryDAO {

	ArrayList<CategoryVO> selectCategoryList(@Param("cri") Criteria cri);

	int selectTotalCountCategory(@Param("cri") Criteria cri);

	ArrayList<CategoryVO> selectCategory();

	CategoryVO selectCategoryCheck(@Param("cat") String category);

	boolean insertCategory(@Param("cat") String category);

	boolean deleteCategory(@Param("ca_num") int num);

	CategoryVO selectdbCategory(@Param("ca_num") int ca_num);

	boolean updateCategory(@Param("cat") CategoryVO category);

}
