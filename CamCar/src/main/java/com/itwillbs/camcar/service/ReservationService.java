package com.itwillbs.camcar.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.ReservationMapper;

@Service
public class ReservationService {

	@Autowired
	private ReservationMapper mapper;
}
