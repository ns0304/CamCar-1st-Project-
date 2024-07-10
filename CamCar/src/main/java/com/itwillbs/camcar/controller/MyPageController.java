package com.itwillbs.camcar.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.camcar.service.MyPageService;
import com.itwillbs.camcar.vo.MemberVO;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService service;
	
	// "MemberInfo" 서블릿 주소 매핑 - GET
	// => mypage.jsp 페이지 포워딩
//	@GetMapping("MemberInfo")
//	public String mypage() {
//		return "mypage/mypage";
//	}
	
	
//	// "service" 서블릿 주소 매핑 - GET
//	// => mypage.jsp 페이지 포워딩
//	@GetMapping("Service")
//	public String myPage() {
//		return "mypage/mypage";
//	}
	
	
	
	// "myInfo" 서블릿 주소 매핑 - GET
	// => myinfo.jsp 페이지 포워딩
	@GetMapping("myInfo")
	public String myInfo() {
		return "mypage/myinfo";
	}
	
	// "changeAddress" 서블릿 주소 매핑 - GET
		// => address_info.jsp 페이지 포워딩
	@GetMapping("changeAddress")
	public String changeAddress() {
		return "mypage/address_info";
	}
	
	// "changeLicense" 서블릿 주소 매핑 - GET
		// => license_info.jsp 페이지 포워딩
	@GetMapping("changeLicense")
	public String changeLicense() {
		return "mypage/license_info";
	}
	
	// [ 회원 상세정보 조회 ]
		// "MemberInfo" 서블릿 주소 매핑 - GET
	@GetMapping("MemberInfo")
	public String memberInfo(MemberVO member, HttpSession session, Model model) {
		// 세션 아이디 없을 경우 "result/fail" 페이지 포워딩 처리
				// => "msg" 속성값 : "로그인 필수!"  
				//    "targetURL" 속성값 : "MemberLogin"(로그인 페이지)
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg","로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return"result/fail";
		}
		
////		member = service.getMember(member);
//		MemberVO dbMember = service.getMember(member);
//		member.setMem_id(id);
//		// Model 객체에 MemberVO 객체 저장 후 member/member_info.jsp 페이지 포워딩
//				model.addAttribute("member", member);
		
		
		return "mypage/mypage";
	}
	
	
	
	
}
