package com.itwillbs.camcar.controller;

import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.MyPageService;
import com.itwillbs.camcar.service.ReservationConfirmService;
import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.MemberVO;
import com.itwillbs.camcar.vo.PayVO;


@Controller
public class ReservationConfirmController {
	@Autowired
	private ReservationConfirmService service;
	@Autowired
	private MyPageService myservice;
	
	// "ReservationList" 서블릿 주소 매핑 - GET
	// => ReservationList.jsp 페이지 포워딩
	@GetMapping("ReservationList")
	public String confirm(MemberVO member, HttpSession session, Model model,
			@RequestParam Map<String, Object> map, CarModelVO carModel, PayVO payInfo) {
		// 세션 아이디 없을 경우 "result/fail" 페이지 포워딩 처리
		// => "msg" 속성값 : "로그인 필수!"  
		//    "targetURL" 속성값 : "MemberLogin"(로그인 페이지)
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg","로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return"result/fail";
		}
		System.out.println("id : " + id);

		//예약확인 페이지  예약내역 조회
		// myservice.getReserveList(id); 재사용 
		List<Map<String, String>> ReserveList= myservice.getReserveList(id);
		System.out.println("ReserveList : " + ReserveList);
		
		// 마이페이지 서비스의 getMember() 재사용
//		MemberVO memberList = myservice.getMember(member);
//		System.out.println("memberlist 정보 : " + memberList);
//		member = service.getMember(member);
		//MemberVO dbMember = service.getMember(member);
//		member.setMem_id(id);
		//// Model 객체에 MemberVO 객체 저장 후 member/member_info.jsp 페이지 포워딩
		//		model.addAttribute("member", member);
		model.addAttribute("ReserveList", ReserveList);
//		model.addAttribute("memberList", memberList);
		
				
		//예약확인 페이지 - 지난 예약내역 조회
		List<Map<String, String>> ReserveList2 = service.getReserveList2(id);
		System.out.println("ReserveList2 : " + ReserveList2);
		
		
		model.addAttribute("ReserveList2", ReserveList2);
				
		
		return "reservation_list/ReservationList";
	}
	
	
	
	// "MoreView" 서블릿 주소 매핑 - GET
	// => ReservationList2.jsp 페이지 포워딩
	@GetMapping("MoreView")
	public String moreView(String res_idx, MemberVO member, HttpSession session, Model model,
			@RequestParam Map<String, Object> map, CarModelVO carModel, PayVO payInfo) {

		// 세션 아이디 없을 경우 "result/fail" 페이지 포워딩 처리
		// => "msg" 속성값 : "로그인 필수!"  
		//    "targetURL" 속성값 : "MemberLogin"(로그인 페이지)
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg","로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return"result/fail";
		}
		System.out.println("id : " + id);
		
		//예약확인 페이지 - 이용 예정 예약내역 조회
		// myservice.getReserveList(id); 재사용 
		List<Map<String, String>> ReserveList= myservice.getReserveList(id);
		
		model.addAttribute("ReserveList", ReserveList);
		System.out.println("ReserveList : " + ReserveList);
		
		
		//예약확인 페이지 - 지난 예약내역 조회
		List<Map<String, String>> ReserveList2 = service.getReserveList2(id);
		
		model.addAttribute("ReserveList2", ReserveList2);
		System.out.println("ReserveList2 : " + ReserveList2);
		
		
		
		return "reservation_list/ReservationList2";
	}
	
	
	// "customerCenter" 서블릿 주소 매핑 - GET
	// => customer_center.jsp 페이지 포워딩
	@GetMapping("customerCenter")
	public String movecenter() {
		
		return "customer_center";
	}
	
	
	// "ReservationDetail" 서블릿 주소 매핑 - GET
		// => reservation_detail.jsp 페이지 포워딩
	@GetMapping("ReservationDetail")
	public String reservationDetail(String res_idx, MemberVO member, HttpSession session, Model model,
			@RequestParam Map<String, Object> map, CarModelVO carModel, PayVO payInfo) {
		// 세션 아이디 없을 경우 "result/fail" 페이지 포워딩 처리
		// => "msg" 속성값 : "로그인 필수!"  
		//    "targetURL" 속성값 : "MemberLogin"(로그인 페이지)
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg","로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return"result/fail";
		}
		System.out.println("id : " + id);

		// 예약확인페이지 - 예약상세 - 상세내역 조회
		// myservice.getReserveList();
		List<Map<String, Object>> ReserveDetail= service.getReserveDetail(res_idx);
		System.out.println("ReserveDetail : " + ReserveDetail);

		model.addAttribute("ReserveDetail", ReserveDetail);


		return "reservation_list/Reservation_detail";
	}
	
	
	
	
	// "ReservationCancel" 서블릿 주소 매핑 - GET
	// => ReservationCancel.jsp 페이지 포워딩
	@GetMapping("ReservationCancel")
	public String reservationCancel(String res_idx, MemberVO member, HttpSession session, Model model,
			@RequestParam Map<String, Object> map, CarModelVO carModel, PayVO payInfo) {
		
		// 세션 아이디 없을 경우 "result/fail" 페이지 포워딩 처리
		// => "msg" 속성값 : "로그인 필수!"  
		//    "targetURL" 속성값 : "MemberLogin"(로그인 페이지)
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg","로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return"result/fail";
		}
		System.out.println("id : " + id);

		
		
		// 예약확인 - 취소 페이지 상세내역 조회 
		// getReserveDetail() 재사용
		List<Map<String, Object>> ReserveCancel = service.getReserveDetail(res_idx);
		System.out.println("ReserveCancel : " + ReserveCancel);
		model.addAttribute("ReserveCancel", ReserveCancel);
		
		System.out.println("drivers_info : " + ReserveCancel);
		
		
		// 취소 수수료 계산
		String res_rental_date = (String) map.get("res_rental_date");

		LocalDateTime now = LocalDateTime.now();
		LocalDateTime rentalTime = LocalDateTime.parse(res_rental_date);
		long cancelHours = ChronoUnit.HOURS.between(now, rentalTime);
		
		System.out.println("cancelHours : " + cancelHours);
		
		
		int cancelFee = 0;
		if(cancelHours >= 72) {
			cancelFee = 0;
		} else if (cancelHours > 0) {
			cancelFee = (int) Math.round(Integer.parseInt((String) map.get("res_fee")) * 0.2);
		} else {
			cancelFee = (int) Math.round(Integer.parseInt((String) map.get("res_fee")) * 0.3);
		}
		
		System.out.println("cancelFee : " + cancelFee);
		model.addAttribute("cancelFee", cancelFee);
		
		return "reservation_list/ReservationCancel";

	}
	
	
	
	
}
