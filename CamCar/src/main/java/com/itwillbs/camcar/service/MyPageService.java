package com.itwillbs.camcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.camcar.mapper.MyPageMapper;
import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;

@Service
public class MyPageService {
	@Autowired
	private MyPageMapper mapper;
	
	// 회원상세 정보 조회 요청
	public MemberVO getMember(MemberVO member) {
		
		return mapper.selectMember(member);
	}
	
	// 회원 탈퇴 요청
	public int withdrawMember(MemberVO member) {
		return mapper.updateWithdrawMember(member);
		
	}
	
	// 운전자 정보 조회 요청
	public DriverVO getDriver(DriverVO driver, String id) {
		return mapper.selectDriver(driver, id);
	}
}
