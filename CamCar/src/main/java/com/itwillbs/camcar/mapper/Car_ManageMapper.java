package com.itwillbs.camcar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.camcar.vo.CarVO;
import com.itwillbs.camcar.vo.MemberVO;

@Mapper
public interface Car_ManageMapper {

	int insertList(CarVO car);
	int selectgetCarListCount(String searchType, String searchKeyword);

	List<CarVO> selectCarList(@Param("searchType") String searchType,
			@Param("searchKeyword") String searchKeyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit")int listLimit);

	

}
