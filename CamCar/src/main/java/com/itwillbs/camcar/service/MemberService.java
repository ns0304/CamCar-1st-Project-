package com.itwillbs.camcar.service;

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
	public MemberVO isExistTel(String mem_tel) {
		return mapper.selectTel(mem_tel);
	}
	
	// 회원 아이디로 비밀번호 찾기
	public MemberVO isExistId(String mem_id) {
		return mapper.selectId(mem_id);
	}
	
	//회원 비밀번호 변경
	public int modifyPasswd(MemberVO member) {
		return mapper.updatePasswd(member);
	}


}
