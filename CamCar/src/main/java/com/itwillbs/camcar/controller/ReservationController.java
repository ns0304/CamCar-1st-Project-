package com.itwillbs.camcar.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
		
		// 선택한 차량 옵션 출력
		List<String> car_optList = null;
		if(car_opt != null) {	// 차량 하나이상 선택 시
			car_optList = Arrays.asList(car_opt);
			model.addAttribute("car_optList", car_optList);
		}
		
		// -----------------------------------------------------------------------------------
		// 차량 모델 리스트 조회 요청(select)
        Map<String, Object> params = new HashMap<>();
        params.put("car_optList", car_optList);

		List<CarModelVO> carModelList = service.getCarModelList(params);
		model.addAttribute("carModelList", carModelList);
		
		// =================================================================================
		// [ 차량 요금 계산 ]
		
		// 대여 시작일시와 반납 종료일시 문자열을 LocalDateTime으로 변환
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime startDate = LocalDateTime.parse(map.get("res_rental_date"), formatter);
		LocalDateTime endDate = LocalDateTime.parse(map.get("res_return_date"), formatter);
		
		// =================================================================================
		
		// 메인에서 선택 된 지점에 따라 지점코드 부여
		int brc_idx = map.get("brc_rent_name").equals("캠핑갈카 부산본점") ? 5101 : 201;
		
		// 차량 상세 리스트 조회 요청(select)
		List<CarVO> carList = service.getCarList(brc_idx);
		
		// 해당 일정에 선택된 차량 리스트 조회 요청 (따로 조회 후 disabled 처리)
		List<CarVO> resCarList = service.getResCarList(brc_idx, startDate, endDate);

        // [ 차량 요금 계산 ]
        Map<Integer, Long> carFeeMap = new HashMap<>();
        for (CarVO car : carList) {
            long totalFee = calculateTotalFee(car, startDate, endDate);
            carFeeMap.put(car.getCar_idx(), totalFee);
        }

		// model 객체에 조회 결과 저장
		model.addAttribute("carList", carList);
		model.addAttribute("resCarList", resCarList);
		model.addAttribute("carFeeMap", carFeeMap);
		
		return "reservation/car_list";
	}
	
	// [ 총 이용시간에 따른 요금 계산하는 메서드 ]
    private long calculateTotalFee(CarVO car, LocalDateTime startDate, LocalDateTime endDate) {
        long totalHours = ChronoUnit.HOURS.between(startDate, endDate);

        long totalWeekdayHours = 0;
        long totalWeekendHours = 0;

        LocalDateTime tempDate = startDate;

        while (tempDate.isBefore(endDate)) {
            if (isWeekend(tempDate)) {
                totalWeekendHours++;
            } else {
                totalWeekdayHours++;
            }
            tempDate = tempDate.plusHours(1);
        }

        long weekdayFee = totalWeekdayHours * car.getCar_weekdays();
        long weekendFee = totalWeekendHours * car.getCar_weekend();

        return weekdayFee + weekendFee;
    }

    private boolean isWeekend(LocalDateTime date) {
        int dayOfWeek = date.getDayOfWeek().getValue();
        // 월요일이 1, 일요일이 7이므로, 주말(금~일)은 5, 6, 7
        return (dayOfWeek == 5 || dayOfWeek == 6 || dayOfWeek == 7);
    }

    // "CarDetail" 서블릿 주소 매핑 - POST
 	@PostMapping("CarDetail")
 	public String carDetailPro(
 			@RequestParam Map<String, String> map, Model model) {
 		System.out.println("대여일시 : " + map.get("res_rental_date"));
 		System.out.println("반납일시 : " + map.get("res_return_date"));
 		System.out.println("차량코드 : " + map.get("car_idx"));
 		System.out.println("차량코드 : " + map.get("rentalFee"));
 		
 		int car_idx = Integer.parseInt(map.get("car_idx"));
 		
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