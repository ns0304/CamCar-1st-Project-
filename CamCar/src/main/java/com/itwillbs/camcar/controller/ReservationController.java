package com.itwillbs.camcar.controller;

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
import com.itwillbs.camcar.vo.CarVO;


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
		
		// 메인에서 선택 된 지점에 따라 지점코드 부여
		int brc_idx = 0;
		if(map.get("brc_rent_name").equals("캠핑갈카 부산본점")) {
			brc_idx = 5101;
		} else if(map.get("brc_rent_name").equals("캠핑갈카 서울지점")) {
			brc_idx = 201;
		}
		
		System.out.println("brc_idx : " + brc_idx);
		
		// 차량 상세 리스트 조회 요청(select)
		List<CarVO> carList = service.getCarList(brc_idx);
		// model 객체에 조회 결과 저장
		model.addAttribute("carList", carList);
		
		
		return "reservation/car_list";
	}
	
	@GetMapping("CarDetail")
	public String carDetailPro(
			@RequestParam Map<String, String> map, int car_idx, Model model) {
		System.out.println("지점 : " + map.get("brc_rent_name"));
		System.out.println("대여일시 : " + map.get("res_rental_date"));
		System.out.println("반납일시 : " + map.get("res_return_date"));
		System.out.println("차량정보 : " + map.get("car_info"));
		
		// 차량 상세정보 조회 요청
		CarVO carDetail = service.getCarDetail(car_idx);
		
		// 조회 결과가 없을 경우 "차량이 조회되지 않습니다" 출력 및 이전페이지 돌아가기 처리
		if(carDetail == null) {
			model.addAttribute("msg", "차량이 조회되지 않습니다");
			return "result/fail";
		}
		
		// Model 객체에 조회 결과 저장
		model.addAttribute("carDetail", carDetail);
		
		
		return "reservation/car_detail";
	}
	
	
}
