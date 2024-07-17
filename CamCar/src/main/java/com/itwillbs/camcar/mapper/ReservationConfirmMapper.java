package com.itwillbs.camcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ReservationConfirmMapper {
	// 예약 상세 조회
	List<Map<String, Object>> selectReserveDetail(String res_idx);



	
}
