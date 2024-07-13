package com.itwillbs.camcar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.CustomerMapper;
import com.itwillbs.camcar.vo.BoardVO;
import com.itwillbs.camcar.vo.QnaVO;

@Service
public class CustomerService {
	@Autowired
	private CustomerMapper mapper;
	
	// 1:1 문의 작성
	public int registInquiry(QnaVO qna) {
		return mapper.insertInquiry(qna);
	}
	
	// 총 게시물 갯수 조회
	public int getBoardListCount(String searchType, String searchKeyword) {
		return mapper.selectBoardListCount(searchType, searchKeyword);
	}
	
	// 게시물 목록 조회
	public List<BoardVO> getBoardList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectBoardList(searchType, searchKeyword, startRow, listLimit);
	}

}
