package com.itwillbs.camcar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.camcar.vo.MemberVO;

@Mapper
public interface MyPageMapper {
	
	// 회원상세 정보 조회
	MemberVO selectMember(MemberVO member);

}
