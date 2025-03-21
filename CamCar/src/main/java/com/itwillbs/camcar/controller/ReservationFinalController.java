package com.itwillbs.camcar.controller;

import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.MyPageService;
import com.itwillbs.camcar.service.ReservationFinalService;
import com.itwillbs.camcar.service.ReservationService;
import com.itwillbs.camcar.vo.AddItemVO;
import com.itwillbs.camcar.vo.CarVO;
import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;
import com.itwillbs.camcar.vo.PayVO;
import com.itwillbs.camcar.vo.ReservationVO;

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
		// 로그인 된 아이디만 예약 진행 가능
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
		
		// 차량 이미지 조회 위해 차량 인덱스에 맞는 모델 정보 저장
//		System.out.println("차량 모델 이미지 : " + map.get("car_model_image"));
//		System.out.println("차량코드 : " + map.get("car_idx"));
		int car_idx = Integer.parseInt(map.get("car_idx"));
		CarVO carDetail = service.getCarDetail(car_idx);
		model.addAttribute("carDetail", carDetail);
		
		// 세션 아이디를 MemberVO에 저장		
		String id = (String)session.getAttribute("sId");		
		
		// MemberPageService - getMember() 메서드 사용하여 회원 데이터 저장
		member = my_service.getMember(member);
		model.addAttribute("member", member);
		
		// MemberPageService - getDriver() 메서드 사용하여 로그인 되어 있는 회원의 운전자 데이터 저장
		driver = my_service.getDriver(driver, id);
		model.addAttribute("driver", driver);
		
		model.getAttribute("carList");
//		System.out.println(model.getAttribute("carList"));
		
		// 요금 계산(보험)
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
		System.out.println("차량코드 : " + map.get("car_idx"));
		int car_idx = Integer.parseInt(map.get("car_idx"));
		model.addAttribute("car_idx", car_idx);
		System.out.println("운전자이름 : " + map.get("dri_name"));
		System.out.println("운전자전화번호 : " + map.get("dri_tel"));
		System.out.println("운전자생년월일 : " + map.get("dri_birthday"));
		System.out.println("면허종류 : " + map.get("lic_info"));
		System.out.println("면허번호 : " + map.get("lic_num"));
		System.out.println("발급일자 : " + map.get("lic_issue_date"));
		System.out.println("만료일자 : " + map.get("lic_expiration_date"));
		System.out.println("지점정보 : " + map.get("brc_idx"));
		System.out.println("보험종류 : " + map.get("insuranceType"));
		
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
	public String reservationPay(@RequestParam Map<String, String> map, Model model, HttpSession session, DriverVO driver, MemberVO member) {
		System.out.println("res_rental_date : " + map.get("res_rental_date"));
		System.out.println("res_return_date : " + map.get("res_return_date"));
		System.out.println("지점정보 : " + map.get("brc_idx"));
		System.out.println("차량코드 : " + map.get("car_idx"));
		System.out.println("보험종류 : " + map.get("insuranceType"));
		System.out.println("면허번호 : " + map.get("lic_num"));
		System.out.println("표준가 : " + map.get("rentalFee"));
		System.out.println("보험료 : " + map.get("insFee"));
		System.out.println("보험대여료 : " + map.get("rentalInsFee"));
//		System.out.println("운전자정보 : " + driver);
		
		
		System.out.println("운전자이름 : " + map.get("dri_name"));
		System.out.println("운전자전화번호 : " + map.get("dri_tel"));
		System.out.println("운전자생년월일 : " + map.get("dri_birthday"));
		System.out.println("면허종류 : " + map.get("lic_info"));
		System.out.println("발급일자 : " + map.get("lic_issue_date"));
		System.out.println("만료일자 : " + map.get("lic_expiration_date"));
	

		int car_idx = Integer.parseInt(map.get("car_idx"));
		
		CarVO carDetail = service.getCarDetail(car_idx);
		model.addAttribute("carDetail", carDetail);
		

		String id = (String)session.getAttribute("sId");
		MemberVO dbmember = service.getMemberInfo(id);
		System.out.println("멤버정보 : " + dbmember);
		model.addAttribute("dbmember", dbmember);
		
		
		return "reservation/reservation_final4";
	}
	
	
	// 예약 완료 - DB에 반영
	
	// "ReservationFin" 서블릿 주소 매핑 - POST
	@PostMapping("ReservationFin")
	public String reservationFin(@RequestParam Map<String, String> map, HttpSession session, Model model, PayVO pay, ReservationVO res, DriverVO driver) {
//		System.out.println("imp_uid : " + map.get("imp_uid"));
		System.out.println("rental_date : " + map.get("rental_date"));
		System.out.println("return_date : " + map.get("return_date"));
		System.out.println("rentalInsFee : " + map.get("rentalInsFee"));
		System.out.println("pay : " + pay);
		System.out.println("res : " + res);
		System.out.println("driver : " + driver);
		
		
		String id = (String)session.getAttribute("sId");	
		model.addAttribute("id", id);
		
		
		int res_fee = Integer.parseInt(map.get("rentalInsFee"));
		res.setRes_fee(res_fee);
		
		Timestamp rentalTimestamp = Timestamp.valueOf(map.get("rental_date") + ":00");
		Timestamp returnTimestamp = Timestamp.valueOf(map.get("return_date") + ":00");
		
		res.setRes_rental_date(rentalTimestamp);
		res.setRes_return_date(returnTimestamp);
		
		String brc_rent_name = map.get("brc_idx").equals("5101")?"캠핑갈카 부산본점":"캠핑갈카 서울지점"; 
		res.setBrc_rent_name(brc_rent_name);
		
		
		int pay_method_idx = map.get("pay_method_name").equals("신용/체크카드")?1:(map.get("pay_method_name").equals("카카오페이")?2:3);
		pay.setPay_method_idx(pay_method_idx);
		pay.setPay_total(res_fee);
		
		
		System.out.println("차량코드 : " + map.get("car_idx"));
		int car_idx = Integer.parseInt(map.get("car_idx"));
		
		CarVO carDetail = service.getCarDetail(car_idx);
		model.addAttribute("carDetail", carDetail);
		
		
		MemberVO dbmember = service.getMemberInfo(id);
		System.out.println("멤버정보 : " + dbmember);
		model.addAttribute("dbmember", dbmember);
		
		// 예약 고유번호 중복 방지 대책 
		String pay_idx = UUID.randomUUID().toString().substring(0, 8);
		pay.setPay_idx(pay_idx);
		
		res.setMem_idx(dbmember.getMem_idx());
		
		System.out.println("pay22 : " + pay);
		System.out.println("res22 : " + res);
		model.addAttribute("pay", pay);
		model.addAttribute("res", res);
		
		// 운전자 정보 DB에 등록
		// 만약, 운전자 정보가 이미 DB에 있다면 DriverVO에는 insert하지 않음 
		int selectCount = service.getSameDriver(driver);
		
		// 등록된 운전자 정보가 없을 경우
		int insertCount1 = 0;
		if(selectCount == 0) {
			insertCount1 = service.registDriver(driver);
		}
		
		// 예약 정보 DB에 등록
		int insertCount2 = service.registResInfo(res);
		
//		System.out.println("res333 : " + res);
		
		// 결제 정보 DB에 등록
		int insertCount3 = 0;
		
		
		if(insertCount2 > 0) {
			System.out.println("예약 정보 등록 성공!");
			int res_idx = res.getRes_idx();
			pay.setRes_idx(res_idx);
			model.addAttribute("res_idx", res_idx);
			insertCount3 = service.registPayInfo(pay);
			
		} else {
			model.addAttribute("msg", "예약 정보 등록 실패!");
			return "result/fail";
		}
		
		if(insertCount3 > 0) {
			System.out.println("운전자 정보 등록 성공!");
			
			
			//마이페이지 예약내역 조회
			List<Map<String, String>> ReserveList= my_service.getReserveList(id);
			System.out.println("ReserveList : " + ReserveList);
			
			model.addAttribute("ReserveList", ReserveList);
			
			
			return "reservation/reservation_final5";
		} else {
			model.addAttribute("msg", "운전자 정보 등록 실패!");
			return "result/fail";
		}
		
		
	}
	
	
}
