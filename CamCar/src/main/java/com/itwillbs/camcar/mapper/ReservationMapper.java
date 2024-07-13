package com.itwillbs.camcar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.CarVO;

@Mapper
public interface ReservationMapper {

	// 차량 모델 리스트 조회
	List<CarModelVO> selectModelList();

	// 차량 상세 리스트 조회
	List<CarVO> selectCarList(int brc_idx);


}
