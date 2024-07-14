package com.itwillbs.camcar.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.ReservationMapper;
import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.CarVO;

@Service
public class ReservationService {

	@Autowired
	private ReservationMapper mapper;

	// 차량 모델 리스트 조회 요청
	public List<CarModelVO> getCarModelList(Map<String, Object> params) {
		return mapper.selectModelList(params);
	}

	// 차량 상세 리스트 조회 요청
	public List<CarVO> getCarList(int brc_idx) {
		return mapper.selectCarList(brc_idx);
	}

	// 차량 상세정보 조회 요청
	public CarVO getCarDetail(int car_idx) {
		return mapper.selectCarDetail(car_idx);
	}
}
