package com.itwillbs.camcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.camcar.vo.BoardVO;

@Mapper
public interface BoardMapper {
	// 게시물 등록
	int insertBoard(BoardVO bo);

	// 게시물 목록 조회 
	List<BoardVO> selectBoardList(
			@Param("searchType") String searchType, // searchType 변수의 파라미터명을 "searchType" 로 지정 
			@Param("searchKeyword") String searchKeyword, // searchKeyword 변수의 파라미터명을 "searchKeyword" 로 지정 
			@Param("startRow") int startRow, // startRow 변수의 파라미터명을 "startRow" 로 지정
			@Param("listLimit") int listLimit); // listLimit 변수의 파라미터명을 "listLimit" 로 지정

	// 전체 게시물 갯수 조회
	int selectBoardListCount(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword);



}









