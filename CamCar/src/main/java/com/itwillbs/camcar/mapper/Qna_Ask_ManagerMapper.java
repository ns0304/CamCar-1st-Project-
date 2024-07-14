package com.itwillbs.camcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.camcar.vo.QnaVO;

@Mapper
public interface Qna_Ask_ManagerMapper {

	// 1:1 문의 게시물 목록 조회
	List<Map<String, Object>> selectQnaList(			
			@Param("searchType") String searchType,
			@Param("searchKeyword") String searchKeyword,
			@Param("startRow") int startRow,
			@Param("listLimit") int listLimit);
	
	// 1:1 게시물 갯수 조회
	int selectQnaListCount(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword);
	
	// 1:1 문의 게시글 상세보기
	QnaVO selectQnaDetail(int qna_number);
	
	// 1:1 문의 게시글 삭제
	int deleteQna(int qna_number);
	
	// 1:1 문의 게시글 답변
	int updateQna(QnaVO dbqna);
	
}
