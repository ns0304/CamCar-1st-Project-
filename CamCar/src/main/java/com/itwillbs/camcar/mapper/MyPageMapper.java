package com.itwillbs.camcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;
import com.itwillbs.camcar.vo.QnaVO;

@Mapper
public interface MyPageMapper {
	

	// 회원상세 정보 조회
	MemberVO selectMember(MemberVO member);
	
	
	// 운전자 정보 조회
	DriverVO selectDriver(
			@Param("driver") DriverVO driver,
			@Param("id") String id);
	
	// 회원 정보 수정
	int updateMember(Map<String, String> map);
	
	// 회원 탈퇴
	int updateWithdrawMember(MemberVO member);
	
	// 나의 1:1 문의 게시물 목록 조회
	List<QnaVO> selectQnaList(
			@Param("searchType") String searchType, 
			@Param("searchKeyword") String searchKeyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit") int listLimit);

	// 나의 1:1 문의 게시글 상세보기
	QnaVO selectMyQnaDetail(int qna_number);

	// 나의 1:1 문의 게시물 갯수 조회
	int selectQnaListCount(
			@Param("searchType") String searchType,
			@Param("searchKeyword") String searchKeyword);

	// 나의 1:1 문의글 삭제
	int deleteMyQna(int qna_number);


	// 비밀번호 변경
	int updateMemPasswd(Map<String, String> map);

	// 주소 변경
	int updateMemAdd(Map<String, String> map);

	//마이페이지 예약내역 조회
	List<Map<String, String>> selectReserveList(String id);


	// 운전면허 정보 수정 
	int updateLicInfo(Map<String, String> map);











}
