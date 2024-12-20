package com.itwillbs.camcar.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.MemberMapper;
import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;

@Service
public class MemberService {
	@Autowired
	private MemberMapper mapper;
	
	// 회원가입 요청
	public int registMember(MemberVO member) {
//		boolean isSuccess = false;
//		int insertMemberCount = mapper.insertMember(member);
//		int insertDriverCount = mapper.insertDriver(drivers);
//		if(insertMemberCount > 0 && insertDriverCount > 0) {
//			isSuccess = true;
//		}
		
//		return isSuccess;
		return mapper.insertMember(member);
	}
	
	// 회원가입 요청(운전자 정보)
	public int registDriver(DriverVO drivers) {
		return mapper.insertDrivers(drivers);
	}
	
	// 회원 상세정보 요청
	public MemberVO getMember(MemberVO member) {
		return mapper.selectMember(member);
	}
	
	// 회원 아이디 전화번호 비교
	public MemberVO isExistTel(MemberVO member) {
		System.out.println("전화번호 검색 요청 : " + member);
		return mapper.selectTel(member);
	}
	
	// 회원 아이디로 비밀번호 찾기
	public MemberVO isExistId(MemberVO member) {
		return mapper.selectId(member);
	}
	
	//회원 비밀번호 변경
	public int modifyPasswd(Map<String, String> map) {
		return mapper.updatePasswd(map);
	}


}
