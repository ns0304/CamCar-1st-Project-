package com.itwillbs.camcar.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.MyPageService;
import com.itwillbs.camcar.service.ReservationFinalService;
import com.itwillbs.camcar.service.ReservationService;
import com.itwillbs.camcar.vo.AddItemVO;
import com.itwillbs.camcar.vo.CarVO;
import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;

@Controller
public class ReservationFinalController {

	@Autowired
	private ReservationFinalService service;
	
	@Autowired
	private MyPageService my_service;
	
	// "Reservation" 서블릿 주소 매핑 - POST
	@PostMapping("Reservation")
	public String reservation(@RequestParam Map<String, String> map, Model model, HttpSession session
			, HttpServletRequest request, MemberVO member, DriverVO driver) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			String prevURL = request.getServletPath();
			if(request.getQueryString() != null) {
				prevURL += "?" + request.getQueryString();
			}
			session.setAttribute("prevURL", prevURL);
			return "result/fail";
		}
		
		System.out.println("차량코드 : " + map.get("car_idx"));
		int car_idx = Integer.parseInt(map.get("car_idx"));
		
		CarVO carDetail = service.getCarDetail(car_idx);
		model.addAttribute("carDetail", carDetail);
		
		// 세션 아이디를 MemberVO에 저장		
		String id = (String)session.getAttribute("sId");		

		// MemberService - getMember() 메서드 재사용하여 회원 상세정보 조회 요청
		member = my_service.getMember(member);
		model.addAttribute("member", member);
		System.out.println("*****id : " + id);
		driver = my_service.getDriver(driver, id);
		
		System.out.println("이름 : " + member);
		
		model.addAttribute("driver", driver);
		
		
		// 요금 계산(보험)
		model.getAttribute("carList");
		System.out.println(model.getAttribute("carList"));
		
		long rentalFee = Integer.parseInt(map.get("rentalFee"));
		
		//전달받은 금액에 요율을 각각 적용하여 일반보험, 완전보험 보험금액 산정
		int insuranceBasicFee = (int) Math.round((rentalFee * 0.03) / 1000) * 1000;
		int insuranceSpecFee = (int) Math.round((rentalFee * 0.05) / 1000) * 1000;
		model.addAttribute("insuranceBasicFee", insuranceBasicFee);
		model.addAttribute("insuranceSpecFee", insuranceSpecFee);
//		System.out.println("insuranceBasicFee : " + insuranceBasicFee);
//		System.out.println("insuranceSpecFee : " + insuranceSpecFee);
		
		return "reservation/reservation_final2";
	}
	
	// "ReservationAdd" 서블릿 주소 매핑 - POST
	@PostMapping("ReservationAdd")
	public String reservationAdd(@RequestParam Map<String, String> map, Model model, HttpSession session, DriverVO driver, MemberVO member) {
		
		System.out.println("보험료 : " + map.get("insFee"));
		System.out.println("표준가 : " + map.get("rentalFee"));
		System.out.println("보험추가결제금액 : " + map.get("rentalInsFee"));
		System.out.println("차량코드 : " + map.get("car_idx"));
		int car_idx = Integer.parseInt(map.get("car_idx"));
		model.addAttribute("car_idx", car_idx);
		
		int insFee = Integer.parseInt(map.get("insFee"));
		int rentalFee = Integer.parseInt(map.get("rentalFee"));
		int rentalInsFee = insFee + rentalFee;
		model.addAttribute("rentalInsFee", rentalInsFee);
	
		
		CarVO carDetail = service.getCarDetail(car_idx);
		model.addAttribute("carDetail", carDetail);
		
		member = my_service.getMember(member);
		model.addAttribute("member", member);
		System.out.println("회원정보 : " + member);
		
		String id = (String)session.getAttribute("sId");	
		driver = my_service.getDriver(driver, id);
		model.addAttribute("driver", driver);
		
		
		return "reservation/reservation_final3";
	}
	
	// "ReservationPay" 서블릿 주소 매핑 - POST
	@PostMapping("ReservationPay")
	public String reservationPay(@RequestParam Map<String, String> map, Model model, HttpSession session, DriverVO driver) {
		System.out.println("res_rental_date : " + map.get("res_rental_date"));
		System.out.println("res_return_date : " + map.get("res_return_date"));
		System.out.println("표준가 : " + map.get("rentalFee"));
		System.out.println("보험료 : " + map.get("insFee"));
//		System.out.println("보험추가금액 : " + map.get("rentalInsFee"));
		System.out.println("차량코드 : " + map.get("car_idx"));
		
		String id = (String)session.getAttribute("sId");	
		driver = my_service.getDriver(driver, id);
		model.addAttribute("driver", driver);
		
		
		int car_idx = Integer.parseInt(map.get("car_idx"));
		
		CarVO carDetail = service.getCarDetail(car_idx);
		model.addAttribute("carDetail", carDetail);
		
		return "reservation/reservation_final4";
	}
	
	// "ReservationFin" 서블릿 주소 매핑 - POST
	@PostMapping("ReservationFin")
	public String reservationFin(@RequestParam Map<String, String> map, Model model) {
		
		System.out.println("차량코드 : " + map.get("car_idx"));
		int car_idx = Integer.parseInt(map.get("car_idx"));
		
		CarVO carDetail = service.getCarDetail(car_idx);
		model.addAttribute("carDetail", carDetail);
		
		return "reservation/reservation_final5";
	}	
	
}
