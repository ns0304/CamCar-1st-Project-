package com.itwillbs.camcar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.CarVO;
import com.itwillbs.camcar.vo.MemberVO;

@Mapper
public interface Car_ManageMapper {

	// 차량 정보 등록
//	int insertCarModel(CarModelVO carModel);

	int selectgetCarListCount(String searchType, String searchKeyword);

	List<CarVO> selectCarList(@Param("searchType") String searchType,
			@Param("searchKeyword") String searchKeyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit")int listLimit);
	
	// 같은 차량모델 있는지 조회
	int selectSameModel(CarModelVO carModel);

	// 차량 모델 정보 등록
	int insertCarModel(CarModelVO carModel);

	// 차량 정보 등록
	int insertCar(CarVO car);


	

	

}
