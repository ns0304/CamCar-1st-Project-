package com.itwillbs.camcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.ReservationConfirmMapper;

@Service
public class ReservationConfirmService {
	@Autowired
	private ReservationConfirmMapper mapper;
	
	// 예약상세 조회 요청
	public List<Map<String, Object>> getReserveDetail(String res_idx) {
		return mapper.selectReserveDetail(res_idx);
	}

	
	

}
