package com.itwillbs.camcar.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.itwillbs.camcar.vo.QnaVO;

@Mapper
public interface CustomerMapper {

	int insertInquiry(QnaVO qna);

}
