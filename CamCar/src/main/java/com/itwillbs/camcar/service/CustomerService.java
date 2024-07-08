package com.itwillbs.camcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.CustomerMapper;

@Service
public class CustomerService {
	@Autowired
	private CustomerService mapper;
}
