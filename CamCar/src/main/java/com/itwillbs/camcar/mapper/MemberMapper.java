package com.itwillbs.camcar.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.itwillbs.camcar.vo.MemberVO;

@Mapper
public interface MemberMapper {

	MemberVO insertMember(MemberVO member);

	int selectMemberListCount(@Param("searchType")String searchType, @Param("searchKeyword")String searchKeyword);

	List<MemberVO> selectMemberList(@Param("searchType") String searchType,
			@Param("searchKeyword") String searchKeyword, 
			@Param("startRow") int startRow, 
			@Param("listLimit")int listLimit);


}
