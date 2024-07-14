package com.itwillbs.camcar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.camcar.vo.BoardVO;
import com.itwillbs.camcar.vo.QnaVO;

@Mapper
public interface CustomerMapper {
	
	// 1:1 문의 글쓰기
	int insertInquiry(QnaVO qna);
	
	// 총 게시물 갯수 조회
	int selectBoardListCount(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword);
	
	// 게시물 목록 조회
	List<BoardVO> selectBoardList(
			@Param("searchType") String searchType, // searchType 변수의 파라미터명을 "searchType" 로 지정 
			@Param("searchKeyword") String searchKeyword, // searchKeyword 변수의 파라미터명을 "searchKeyword" 로 지정 
			@Param("startRow") int startRow, // startRow 변수의 파라미터명을 "startRow" 로 지정
			@Param("listLimit") int listLimit);
	
	// 공지사항 게시글 상세정보 조회
	BoardVO selectBoardDetail(int board_num);
	
	// 공지사항 게시글 조회수 증가
	void updateReadcount(BoardVO bo);


}
