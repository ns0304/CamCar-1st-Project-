package com.itwillbs.camcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.MyPageMapper;
import com.itwillbs.camcar.vo.MemberVO;

@Service
public class MyPageService {
	@Autowired
	private MyPageMapper mapper;
	
	// 회원상세 정보 조회 요청
	public MemberVO getMember(MemberVO member) {
		
		return mapper.selectMember(member);
	}
}
