package com.itwillbs.camcar.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.CustomerService;
import com.itwillbs.camcar.vo.QnaVO;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService service;
	
	// 고객센터 페이지
	// http://localhost:8081/camcar/Customer
	@GetMapping("Customer")
	public String customer() {
		return "customer/customer_list";
	}
	
	// 공지사항 페이지
	// http://localhost:8081/camcar/board_list
	@GetMapping("board_list")
	public String board() {
		return "board/board_list";
	}
	
	
	// 1:1 문의 페이지
	// http://localhost:8081/camcar/Inquiry
	@GetMapping("Inquiry")
	public String inquiry(Model model, HttpSession session, HttpServletRequest request) {
		
		// 로그인 하지 않은 사용자일 경우 "로그인 필수!" 출력 후 "MemberLogin" 페이지 포워딩 처리
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			// ----------------------------------------------
			// request 객체의 getServletPath() 메서드 호출 시 요청 서블릿 주소 추출
//			System.out.println("request.getServletPath() : " + request.getServletPath());
			// request 객체의 getQueryString() 메서드 호출 시 요청 파라미터 추출
			// => 단, 파라미터가 없을 경우 null 값 리턴됨
//			System.out.println("request.getQueryString() : " + request.getQueryString());
			// ----------------------------------------------
			// prevURL 변수에 서블릿 주소 저장
			String prevURL = request.getServletPath();
			// 요청 파라미터가 존재할 경우(null 아님) prevURL 뒤에 요청 파라미터 결합
			if(request.getQueryString() != null) {
				prevURL += "?" + request.getQueryString();
			}
			
//			System.out.println("prevURL : " + prevURL);
			
			// 세션 객체에 targetURL 값 저장
			session.setAttribute("prevURL", prevURL);
			// ----------------------------------------------
			return "result/fail";
		}
		
		
		return "inquiry/inquiry_write_form";
	}
	
	// 1:1 문의 글쓰기
	@PostMapping("InquiryWritePro")
	public String inquiryWritePro(QnaVO qna, Model model) {
		int insertCount = service.registInquiry(qna);
		
		if(insertCount > 0) {
			return "customer/customer_list";
		} else {
			model.addAttribute("msg", "글쓰기 실패!");
			return "result/fail";
		}
//		return "customer/customer_list";
	}
	
	// 자주찾는 질문(예약)
	// http://localhost:8081/camcar/Reservation
	@GetMapping("Question_reserve")
	public String questionReserve() {
		return "question/question_reserve";
	}
	
	// 자주찾는 질문(예약확인/변경)
	@GetMapping("Question_drivers")
	public String questionCheck() {
		return "question/question_drivers";
	}
	
	// 자주찾는 질문(보험)
	@GetMapping("Question_insurance")
	public String questionInsurance() {
		return "question/question_insurance";
	}
	
	// 자주찾는 질문(고장/사고)
	@GetMapping("Question_accident")
	public String questionAccident() {
		return "question/question_accident";
	}
}

















