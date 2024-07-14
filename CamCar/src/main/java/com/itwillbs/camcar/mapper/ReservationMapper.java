package com.itwillbs.camcar.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.CarVO;

@Mapper
public interface ReservationMapper {

	// 차량 모델 리스트 조회
	List<CarModelVO> selectModelList(Map<String, Object> params);

	// 차량 상세 리스트 조회
	List<CarVO> selectCarList(int brc_idx);

	// 차량 상세정보 조회
	CarVO selectCarDetail(int car_idx);

}
