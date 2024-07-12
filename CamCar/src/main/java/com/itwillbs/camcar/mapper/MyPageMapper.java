package com.itwillbs.camcar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;

@Mapper
public interface MyPageMapper {
	

	// 회원상세 정보 조회
	MemberVO selectMember(MemberVO member);
	
	// 회원 탈퇴
	int updateWithdrawMember(MemberVO member);
	
	// 운전자 정보 조회
//	DriverVO selectDriver(DriverVO driver);
}
