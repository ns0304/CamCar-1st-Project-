package com.itwillbs.camcar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


@Controller
public class ReservationConfirmController {
	
	
	
	// "ReservationList" 서블릿 주소 매핑 - GET
	// => ReservationList.jsp 페이지 포워딩
	@GetMapping("ReservationList")
	public String confirm() {
		
		return "reservation_list/ReservationList";
	}
	
	
	
	// "customerCenter" 서블릿 주소 매핑 - GET
	// => customer_center.jsp 페이지 포워딩
	@GetMapping("customerCenter")
	public String movecenter() {
		
		return "customer_center";
	}
	
	// "reservationDetail" 서블릿 주소 매핑 - GET
		// => reservation_detail.jsp 페이지 포워딩
	@GetMapping("reservationDetail")
	public String reservationDetail() {
		
		return "reservation_detail";
	}
}
