package com.itwillbs.camcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.itwillbs.camcar.mapper.MyPageMapper;
import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;
import com.itwillbs.camcar.vo.QnaVO;

@Service
public class MyPageService {
	@Autowired
	private MyPageMapper mapper;
	
	// 회원상세 정보 조회 요청
	public MemberVO getMember(MemberVO member) {
		
		return mapper.selectMember(member);
	}
	
	
	// 운전자 정보 조회 요청
	public DriverVO getDriver(DriverVO driver, String id) {
		return mapper.selectDriver(driver, id);
	}
	
	// 회원 정보 수정 요청
	public int modifyMember(Map<String, String> map) {
		return mapper.updateMember(map);
	}
	
	// 회원 탈퇴 요청
	public int withdrawMember(MemberVO member) {
		return mapper.updateWithdrawMember(member);
		
	}

	// 나의 1:1 문의 게시물 목록 조회 요청
	public List<QnaVO> getQnaList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectQnaList(searchType, searchKeyword, startRow, listLimit);
	}


	// 나의 1:1 문의 총 게시물 조회 요청
	public int getQnaListCount(String searchType, String searchKeyword) {
		return mapper.selectQnaListCount(searchType, searchKeyword);
	}

	// 나의 1:1 문의글 상세보기
	public QnaVO getMyQna(int qna_number) {
		return mapper.selectMyQnaDetail(qna_number);
	}

	// 나의 1:1 문의글 삭제
	public int removeMyQna(int qna_number) {
		return mapper.deleteMyQna(qna_number);
	}
	
	
}
