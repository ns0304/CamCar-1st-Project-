package com.itwillbs.camcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.ReservationFinalMapper;
import com.itwillbs.camcar.mapper.ReservationMapper;
import com.itwillbs.camcar.vo.AddItemVO;
import com.itwillbs.camcar.vo.CarVO;

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
	
}
