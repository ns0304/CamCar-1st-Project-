package com.itwillbs.camcar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.ReservationMapper;
import com.itwillbs.camcar.vo.CarModelVO;

@Service
public class ReservationService {

	@Autowired
	private ReservationMapper mapper;

	// 차량 모델 리스트 조회 요청
	public List<CarModelVO> getCarModelList() {
		return mapper.selectModelList();
	}

	// 모델명 상세 정보 조회 요청
	public CarModelVO getCarModel(String car_model) {
		return mapper.selectModel(car_model);
	}
}
