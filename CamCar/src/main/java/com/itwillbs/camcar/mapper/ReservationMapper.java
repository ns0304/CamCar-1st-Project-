package com.itwillbs.camcar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.camcar.vo.CarModelVO;

@Mapper
public interface ReservationMapper {

	// 차량 모델 리스트 조회
	List<CarModelVO> selectModelList();

	// 모델명 상세 정보 조회
	CarModelVO selectModel(String car_model);

}
