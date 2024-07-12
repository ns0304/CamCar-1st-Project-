package com.itwillbs.camcar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.Qna_Ask_ManagerMapper;
import com.itwillbs.camcar.vo.QnaVO;

@Service
public class Qna_Ask_ManagerService {
	@Autowired
	private Qna_Ask_ManagerMapper mapper;

	// 게시물 목록 조회 요청
	public List<QnaVO> getQnaList(int startRow, int listLimit) {
		return mapper.selectQnaList(startRow, listLimit);
	}

	public int getQnaListCount(String searchType, String searchKeyword) {
		return mapper.selectQnaListCount(searchType, searchKeyword);
	}

	
}
