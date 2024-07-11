package com.itwillbs.camcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.CustomerMapper;
import com.itwillbs.camcar.vo.QnaVO;

@Service
public class CustomerService {
	@Autowired
	private CustomerMapper mapper;
	
	// 1:1 문의 작성
	public int registInquiry(QnaVO qna) {
		return mapper.insertInquiry(qna);
	}

}
