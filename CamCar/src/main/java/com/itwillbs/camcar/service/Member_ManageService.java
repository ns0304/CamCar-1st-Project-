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
		return mapper.selectMemberListCount(searchType, searchKeyword);
	}

	public List<MemberVO> getMemberList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectMemberList(searchType, searchKeyword, startRow, listLimit);
	}
	
	//회원 상세 정보보기
	public MemberVO getMemberInfoDetail(MemberVO member) {
		return mapper.selectMemberInfoDetail(member);
	}

	



}
