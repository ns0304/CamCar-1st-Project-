package com.itwillbs.camcar.service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.ReservationMapper;
import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.CarVO;
import com.itwillbs.camcar.vo.ReviewVO;

@Service
public class ReservationService {

	@Autowired
	private ReservationMapper mapper;

	// 차량 모델 리스트 조회 요청
	public List<CarModelVO> getCarModelList(Map<String, Object> car_type) {
		return mapper.selectModelList(car_type);
	}

	// 차량 상세 리스트 조회 요청
	public List<CarVO> getCarList(int brc_idx, Map<String, Object> car_opts) {
		return mapper.selectCarList(brc_idx, car_opts);
	}

	// 해당 일정에 선택된 차량 리스트 조회 요청
	public List<String> getResCarList(int brc_idx, LocalDateTime startDate, LocalDateTime endDate) {
		return mapper.selectResCarList(brc_idx, startDate, endDate);
	}

	// 차량 상세정보 조회 요청
	public CarVO getCarDetail(int car_idx) {
		return mapper.selectCarDetail(car_idx);
	}

	// 차량 모델 이미지 조회 요청
	public String getCarModelImage(String car_model) {
		return mapper.selectCarModelImage(car_model);
	}

	// 이용자 리뷰 조회 요청
	public List<ReviewVO> getUserReview(int car_idx) {
		return mapper.selectUserReview(car_idx);
	}

}
