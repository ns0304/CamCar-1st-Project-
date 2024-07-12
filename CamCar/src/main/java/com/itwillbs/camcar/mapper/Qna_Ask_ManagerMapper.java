package com.itwillbs.camcar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.camcar.vo.QnaVO;

@Mapper
public interface Qna_Ask_ManagerMapper {

	List<QnaVO> selectQnaList(			
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);

	int selectQnaListCount(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword);
	
}
