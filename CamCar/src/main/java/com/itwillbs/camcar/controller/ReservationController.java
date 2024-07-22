package com.itwillbs.camcar.controller;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.ReservationService;
import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.CarVO;
import com.itwillbs.camcar.vo.ReviewVO;


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
			@RequestParam(name = "car_opt", required = false) String[] car_opt, 
            @RequestParam(name = "fuel_opt", required = false) String[] fuel_opt, 
            @RequestParam(name = "age_opt", required = false) String[] age_opt, 
            @RequestParam(name = "drive_opt", required = false) String[] drive_opt, 
            @RequestParam(name = "model_opt", required = false) String[] model_opt, 
            @RequestParam(name = "pet_opts", required = false) String[] pet_opts,
			CarModelVO carModel) {
		System.out.println("지점 : " + map.get("brc_rent_name"));
		System.out.println("대여일시 : " + map.get("res_rental_date"));
		System.out.println("반납일시 : " + map.get("res_return_date"));
		
		// 필터 조건을 model에 저장
		List<String> car_typeList = null;
		List<String> car_fuel_typeList = null;
		List<String> car_age = null;
		List<String> car_career = null;
//		List<String> car_oldList = null;
		List<String> pet_opt = null;
		if(car_opt != null) {	// 차량 하나이상 선택 시
			car_typeList = Arrays.asList(car_opt);
			model.addAttribute("car_typeList", car_typeList);	// 차종 선택
		}
		if(fuel_opt != null) {	// 연료 선택 시
			car_fuel_typeList = Arrays.asList(fuel_opt);
			model.addAttribute("car_fuel_typeList", car_fuel_typeList);
		}
		if(age_opt != null) {	// 나이제한 선택 시
			car_age = Arrays.asList(age_opt);
			model.addAttribute("car_age", car_age);
		}
		if(drive_opt != null) {	// 운전경력 제한 선택 시
			car_career = Arrays.asList(drive_opt);
			model.addAttribute("car_career", car_career);
		}
		// 연식 선택 시 최소값-1부터 최대값까지 계산
		if (model_opt != null) {	// 연식 선택 시
		    List<Integer> years = Arrays.stream(model_opt)
		                                 .map(Integer::parseInt)
		                                 .collect(Collectors.toList());
		    int minValue = Collections.min(years) - 1;
		    int maxValue = Collections.max(years);

		    Map<String, Integer> range = new HashMap<>();
		    range.put("startYear", minValue);
		    range.put("endYear", maxValue);

		    model.addAttribute("car_oldList", range);
		}
		if(pet_opts != null) {	// 반려동물 동승 여부 선택 시
			pet_opt = Arrays.asList(pet_opts);
			model.addAttribute("pet_opt", pet_opt);
		}
		
		// -----------------------------------------------------------------------------------
		// 차량 모델 리스트 조회 요청(select)
        Map<String, Object> car_type = new HashMap<>();
        car_type.put("car_typeList", car_typeList);
        Map<String, Object> car_opts = new HashMap<>();
        car_opts.put("car_fuel_typeList", car_fuel_typeList);
        car_opts.put("car_age", car_age);
        car_opts.put("car_career", car_career);
        car_opts.put("car_oldList", model.getAttribute("car_oldList"));
        car_opts.put("pet_opt", pet_opt);
        

		List<CarModelVO> carModelList = service.getCarModelList(car_type);
		
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
		List<CarVO> carList = service.getCarList(brc_idx, car_opts);
		
		// 해당 일정에 선택된 차량 코드 리스트 조회 요청 (따로 조회 후 disabled 처리)
		List<String> resCarList = service.getResCarList(brc_idx, startDate, endDate);

		
		// =================================================================================
        // [ 차량 요금 계산 ]
        Map<Integer, Long> carFeeMap = new HashMap<>();
        for (CarVO car : carList) {
            long totalFee = calculateTotalFee(car, startDate, endDate);
            carFeeMap.put(car.getCar_idx(), totalFee);
        }
        
        // ----------------------------------------------------------------------------------
		// model 객체에 조회 결과 저장
        model.addAttribute("carModelList", carModelList);	// 차량 모델 리스트
		model.addAttribute("carList", carList);	// 차량 상세 리스트
		model.addAttribute("resCarList", resCarList);	// 예약된 차량코드 리스트
		model.addAttribute("carFeeMap", carFeeMap);	// 총 대여시간에 따른 차량 요금
		
		return "reservation/car_list";
	}
	
	// -----------------------------------------------------------------------------------------
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
    // -----------------------------------------------------------------------------------------


    
    // "CarDetail" 서블릿 주소 매핑 - POST
 	@PostMapping("CarDetail")
 	public String carDetailPro(
 			@RequestParam Map<String, String> map, Model model) {
	 		System.out.println("대여일시 : " + map.get("res_rental_date"));
	 		System.out.println("반납일시 : " + map.get("res_return_date"));
	 		System.out.println("차량코드 : " + map.get("car_idx"));
	 		System.out.println("차량코드 : " + map.get("rentalFee"));
 		
 		int car_idx = Integer.parseInt(map.get("car_idx"));
 		
 		// ----------------------------------------------------------------------------------
 		// 차량 상세정보 조회 요청
 		CarVO carDetail = service.getCarDetail(car_idx);
 		
 		// 조회 결과가 없을 경우 "차량이 조회되지 않습니다" 출력 및 이전페이지 돌아가기 처리
 		if(carDetail == null) {
 			model.addAttribute("msg", "차량이 조회되지 않습니다");
 			return "result/fail";
 		}
 		
 		String car_model = carDetail.getCar_model();
 		System.out.println("car_model : " + car_model);
 		
 		// ----------------------------------------------------------------------------------
 		// 차량 모델 이미지 조회 요청
 		String car_model_image = service.getCarModelImage(car_model);

 		// ----------------------------------------------------------------------------------
 		// 이용자 리뷰 조회 요청
 		List<ReviewVO> user_review = service.getUserReview(car_idx);
 		
 		// ----------------------------------------------------------------------------------
 		// Model 객체에 조회 결과 저장
 		model.addAttribute("carDetail", carDetail);
 		model.addAttribute("car_model_image", car_model_image);
 		model.addAttribute("user_review", user_review);
 		
 		
 		return "reservation/car_detail";
 	}
	
}