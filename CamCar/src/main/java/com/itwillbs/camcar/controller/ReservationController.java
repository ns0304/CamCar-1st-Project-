package com.itwillbs.camcar.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.ReservationService;
import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.ReservationVO;


@Controller
public class ReservationController {
	@Autowired
	private ReservationService service;
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
			@RequestParam(name= "car_opt", required = false) String[] car_opt, 
			CarModelVO carModel) {
		System.out.println("지점 : " + map.get("brc_rent_name"));
		System.out.println("대여일시 : " + map.get("res_rental_date"));
		System.out.println("반납일시 : " + map.get("res_return_date"));
		if(car_opt != null) {	// 차량 하나이상 선택 시
			List<String> car_optList = Arrays.asList(car_opt);
			model.addAttribute("car_optList", car_optList);
		}
//		System.out.println("차량선택 : " + map.get("car_opt"));
		
		// -----------------------------------------------------------------------------------
		// 차량 모델 리스트 조회 요청(select)
		List<CarModelVO> carModelList = service.getCarModelList();
		// model 객체에 조회 결과 저장
		model.addAttribute("carModelList", carModelList);
		
		// -----------------------------------------------------------------------------------
		// 모델명 상세 정보 조회 요청(select)
//		CarModelVO carModelDetail = service.getCarModel(car_model);
//		model.addAttribute("carModelDetail", carModelDetail);
//		System.out.println("carModelDetail : " + carModelDetail);
		// -----------------------------------------------------------------------------------
		// 뷰페이지에서 파일 목록의 효율적 처리를 위해 파일명만 별도로 List 객체에 저장
//		List<String> fileCarModelList = new ArrayList<String>();
//		fileCarModelList.add(carModel.getCar_model_image());
//		fileCarModelList.add(carModel.getCar_logo_image());
//		// Model 객체에 차량모델 리스트, 파일 목록 저장
//		model.addAttribute("fileCarModelList", fileCarModelList);
//		System.out.println("fileCarModelList : " + fileCarModelList);
		
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
	
}
