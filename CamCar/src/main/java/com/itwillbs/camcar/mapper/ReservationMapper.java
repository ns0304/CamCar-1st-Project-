package com.itwillbs.camcar.mapper;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.CarVO;

@Mapper
public interface ReservationMapper {

	// 차량 모델 리스트 조회
	List<CarModelVO> selectModelList(Map<String, Object> params);

	// 차량 상세 리스트 조회
	List<CarVO> selectCarList(int brc_idx);
	
	// 해당 일정에 선택된 차량 리스트 조회
	List<CarVO> selectResCarList(
			@Param("brc_idx") int brc_idx, 
			@Param("startDate") LocalDateTime startDate, 
			@Param("endDate") LocalDateTime endDate);

	// 차량 상세정보 조회
	CarVO selectCarDetail(int car_idx);

}
