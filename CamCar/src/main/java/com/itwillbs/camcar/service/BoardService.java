package com.itwillbs.camcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.BoardMapper;
import com.itwillbs.camcar.vo.BoardVO;

@Service
public class BoardService {
	@Autowired
	private BoardMapper mapper;

	// 공지사항 등록 요청
	public int applyBoard(BoardVO bo) {
		return mapper.insertBoard(bo);
	}
	

	// 공지사항 목록 조회 요청
	public List<BoardVO> getBoardList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectBoardList(searchType, searchKeyword, startRow, listLimit);
	}

	// 공지사항 총 갯수 조회 요청
	public int getBoardListCount(String searchType, String searchKeyword) {
		return mapper.selectBoardListCount(searchType, searchKeyword);
	}

	//공지사항 상세 조회
	public BoardVO getBoardManageDetail(int bo_idx, boolean b) {
		BoardVO bo = mapper.selectBoardManageDetail(bo_idx);
		return bo;
	}


	//공지사항 삭제
	public int deleteBoard(int bo_idx) {
		return mapper.deleteBoard(bo_idx);
	}


	
	//공지사항 수정
	public int modifyBoard(BoardVO bo) {
		return mapper.updateBoard(bo);
	}
	




	
}







