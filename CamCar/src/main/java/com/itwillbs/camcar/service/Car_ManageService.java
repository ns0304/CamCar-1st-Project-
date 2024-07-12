package com.itwillbs.camcar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.Car_ManageMapper;
import com.itwillbs.camcar.mapper.Member_ManageMapper;
import com.itwillbs.camcar.vo.BoardVO;
import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.CarVO;
import com.itwillbs.camcar.vo.MemberVO;

@Service
public class Car_ManageService {
	@Autowired
	private Car_ManageMapper mapper;


	
	public int getCarListCount(String searchType, String searchKeyword) {
		return mapper.selectgetCarListCount(searchType, searchKeyword);
	}

	public List<CarVO> getCarList(String searchType, String searchKeyword, int startRow, int listLimit) {
		
		return mapper.selectCarList(searchType, searchKeyword, startRow, listLimit);
	}


	// 차량 모델 정보 등록 요청
	public int registCarModel(CarModelVO carModel) {
		return mapper.insertCarModel(carModel);
	}

	// 차량 정보 등록 요청
	public int registCar(CarVO car) {
		return mapper.insertCar(car);
	}

	



	
	



}
