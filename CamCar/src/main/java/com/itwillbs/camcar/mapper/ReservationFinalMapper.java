package com.itwillbs.camcar.mapper;

import org.apache.ibatis.annotations.Param;

import com.itwillbs.camcar.vo.AddItemVO;
import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;
import com.itwillbs.camcar.vo.PayVO;
import com.itwillbs.camcar.vo.ReservationVO;

public interface ReservationFinalMapper {

	AddItemVO selectItemDetail(String item_code);

	MemberVO selectMemberInfo(String id);
	
	// 회원 idx 조회
	int selectMemIdx(String id);

	// 운전자 정보가 등록되어 있는지 조회
	int selectSameDriver(DriverVO driver);

	// 운전자 정보 등록
	int insertDriver(DriverVO driver);

	// 예약 정보 등록
	int insertResInfo(ReservationVO res);

	// 결제 정보 등록
	int insertPayInfo(PayVO pay);
	
}
