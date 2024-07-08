package com.itwillbs.camcar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MyPageController {
	
	// "service" 서블릿 주소 매핑 - GET
	// => mypage.jsp 페이지 포워딩
	@GetMapping("Service")
	public String myPage() {
		return "mypage/mypage";
	}
	
	
	
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
	
	
	
}
