package com.itwillbs.camcar.controller;

import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.vo.ReservationVO;


@Controller
public class ReservationController {
//	// "CarList" 서블릿 주소 매핑 - GET
//	@GetMapping("CarList")
//	public String reservation() {
//		return "reservation/car_list";
//	}
//
	// "CarList" 서블릿 주소 매핑 - POST
	@PostMapping("CarList")
	public String carListPro(
			@RequestParam Map<String, String> map, Model model,
			@RequestParam(name= "car_opt", required = false) String[] car_opt) {
		System.out.println("지점 : " + map.get("brc_rent_name"));
		System.out.println("대여일시 : " + map.get("res_rental_date"));
		System.out.println("반납일시 : " + map.get("res_return_date"));
		if(car_opt != null) {	// 차량 하나이상 선택 시
			List<String> car_optList = Arrays.asList(car_opt);
			model.addAttribute("car_optList", car_optList);
		}
//		System.out.println("차량선택 : " + map.get("car_opt"));
		
		return "reservation/car_list";
	}
	
	@PostMapping("CarDetail")
	public String carDetailPro(
			@RequestParam Map<String, String> map) {
		System.out.println("지점 : " + map.get("brc_rent_name"));
		System.out.println("대여일시 : " + map.get("res_rental_date"));
		System.out.println("반납일시 : " + map.get("res_return_date"));
		System.out.println("차량정보 : " + map.get("car_info"));
		
		return "reservation/car_detail";
	}
	
	
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
