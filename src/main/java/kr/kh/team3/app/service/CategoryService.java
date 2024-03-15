package kr.kh.team3.app.service;

import java.util.ArrayList;

import kr.kh.team3.app.model.vo.CategoryVO;
import kr.kh.team3.app.pagination.Criteria;

public interface CategoryService {

	ArrayList<CategoryVO> getCategoryList(Criteria cri);

	int getTotalCountCategory(Criteria cri);

}
