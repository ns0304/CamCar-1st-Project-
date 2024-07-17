package com.itwillbs.camcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.ReservationFinalMapper;
import com.itwillbs.camcar.mapper.ReservationMapper;
import com.itwillbs.camcar.vo.AddItemVO;
import com.itwillbs.camcar.vo.CarVO;
import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;
import com.itwillbs.camcar.vo.PayVO;
import com.itwillbs.camcar.vo.ReservationVO;

@Service
public class ReservationFinalService {

	@Autowired
	private ReservationFinalMapper mapper;
	
	@Autowired
	private ReservationMapper mapper2;
	
	public CarVO getCarDetail(int car_idx) {
		return mapper2.selectCarDetail(car_idx);
	}
	
	public AddItemVO getItemDetail(String item_code) {
		return mapper.selectItemDetail(item_code);
	}

	public MemberVO getMemberInfo(String id) {
		// TODO Auto-generated method stub
		return mapper.selectMemberInfo(id);
	}
	
	// 회원 idx 조회
	public int getMemIdx(String id) {
		// TODO Auto-generated method stub
		return mapper.selectMemIdx(id);
	}
	

	// 운전자 정보가 등록되어 있는지 조회 요청
	public int getSameDriver(DriverVO driver) {
		// TODO Auto-generated method stub
		return mapper.selectSameDriver(driver);
	}

	// 운전자 정보 등록 요청
	public int registDriver(DriverVO driver) {
		// TODO Auto-generated method stub
		return mapper.insertDriver(driver);
	}

	// 예약 정보 등록 요청
	public int registResInfo(ReservationVO res) {
		// TODO Auto-generated method stub
		return mapper.insertResInfo(res);
	}

	// 결제 정보 등록 요청
	public int registPayInfo(PayVO pay) {
		// TODO Auto-generated method stub
		return mapper.insertPayInfo(pay);
	}

	
	
	
	
	
}



