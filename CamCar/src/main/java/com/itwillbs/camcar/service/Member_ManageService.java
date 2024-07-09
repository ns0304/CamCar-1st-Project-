package com.itwillbs.camcar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.Member_ManageMapper;
import com.itwillbs.camcar.vo.MemberVO;

@Service
public class Member_ManageService {
	@Autowired
	private Member_ManageMapper mapper;

	public int getMemberListCount(String searchType, String searchKeyword) {
		// TODO Auto-generated method stub
		return mapper.selectMemberListCount(searchType, searchKeyword);
	}

	public List<MemberVO> getMemberList(String searchType, String searchKeyword, int startRow, int listLimit) {
		// TODO Auto-generated method stub
		return mapper.selectMemberList(searchType, searchKeyword, startRow, listLimit);
	}



}