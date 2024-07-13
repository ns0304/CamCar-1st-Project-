package com.itwillbs.camcar.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.itwillbs.camcar.service.ReservationService;

@Controller
public class ReservationFinalController {

	@Autowired
	private ReservationService service;	
	
	// "Reservation" 서블릿 주소 매핑 - POST
	@PostMapping("Reservation")
	public String reservation() {
		
		return "reservation/reservation_final2";
	}
	
	// "ReservationAdd" 서블릿 주소 매핑 - POST
	@PostMapping("ReservationAdd")
	public String reservationAdd() {
		
		return "reservation/reservation_final3";
	}
	
	// "ReservationPay" 서블릿 주소 매핑 - POST
	@PostMapping("ReservationPay")
	public String reservationPay() {
		
		return "reservation/reservation_final4";
	}
	
	// "ReservationFin" 서블릿 주소 매핑 - POST
	@PostMapping("ReservationFin")
	public String reservationFin() {
		
		return "reservation/reservation_final5";
	}	
	
	
	
}
