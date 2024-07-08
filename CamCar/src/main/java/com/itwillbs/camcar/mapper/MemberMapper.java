package com.itwillbs.camcar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;

@Mapper
public interface MemberMapper {
	
	// 회원가입
	int insertMember(MemberVO member);
	
	// 회원가입(운전자정보)
	int insertDrivers(DriverVO drivers);
	
	// 회원 상세정보 조회
	MemberVO selectMember(MemberVO member);
	
	// 회원 전화번호로 아이디 찾기
	MemberVO selectTel(String mem_tel);
	
	// 회원 아이디로 비밀번호 찾기
	MemberVO selectId(String mem_id);
	
	// 회원 비밀번호 변경
	int updatePasswd(MemberVO member);
	
	
	
	
	
	// 회원가입
//	int insertDriver(DriverVO drivers);

}