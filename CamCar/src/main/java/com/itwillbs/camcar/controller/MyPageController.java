package com.itwillbs.camcar.controller;

import java.io.Console;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.MyPageService;
import com.itwillbs.camcar.vo.DriverVO;
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
//	@GetMapping("myInfo")
//	public String myInfo() {
//		return "mypage/myinfo";
//	}
	
	// "changeAddress" 서블릿 주소 매핑 - GET
		// => address_info.jsp 페이지 포워딩
//	@GetMapping("changeAddress")
//	public String changeAddress() {
//		return "mypage/address_info";
//	}
	
	// "changeLicense" 서블릿 주소 매핑 - GET
		// => license_info.jsp 페이지 포워딩
//	@GetMapping("changeLicense")
//	public String changeLicense() {
//		return "mypage/license_info";
//	}
	
	// [ 마이페이지 ]
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
	
	// [ 내 정보 관리 - 조회 ]
	// "myInfo" 서블릿 주소 매핑 - GET
	@GetMapping("myInfo")
	public String myInfo(MemberVO member, HttpSession session, Model model, DriverVO driver) {
		// 세션 아이디 없을 경우 "result/fail" 페이지 포워딩 처리
		// => "msg" 속성값 : "로그인 필수!"  
		//    "targetURL" 속성값 : "MemberLogin"(로그인 페이지)
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg","로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return "result/fail";
		}
		
		//-------------------------
		//
		member.setMem_id(id); // 세션 아이디 저장
		// MemberService - getMember() 메서드 재사용하여 회원 상세정보 조회 요청
		member = service.getMember(member);
		driver = service.getDriver(driver, id);
		
		
//		MemberVO member = service.getMember(member);
		
		// Model 객체에 MemberVO, DriverVO 객체 저장 후 mypage/myinfo.jsp 페이지 포워딩
		model.addAttribute("member", member);
		model.addAttribute("driver", driver);
		
		return "mypage/myinfo";
		
		
	}
	
	// [ 내정보 관리 - 수정 ]
	@PostMapping("MyInfoModify")
	public String myyInfoModify(@RequestParam Map<String, String> map, MemberVO member, BCryptPasswordEncoder passwordEncoder, Model model) {
		// 파라미터 매핑용 Map타입을 선언한 상태에서 MemberVo 타입 파라미터도 선언 시 
		// 두 객체 모두 파라미터 데이터가 저장됨.
		System.out.println("map : " + map);
		System.out.println("member : " + member);
		
		//MemberService - getMember() 메서드 재사용하여 회원 상세정보 조회 요청
		// => 조회된 상세정보의 암호화 된 패스워드와 입력받은 기존 패스워드 비교 
		// 만약, 두 패스워드가 다르면, "수정권한이 없습니다!" 출력 
		member = service.getMember(member);
		System.out.println("member : " + member);
//		if(!passwordEncoder.matches(map.get("oldPasswd"), member.getMem_passwd())) { // 패스워드 불일치 
//			model.addAttribute("msg", "수정 권한이 없습니다!");
//		}
		//------------------------------------------------------------------------------
		// 기존 비밀번호 일치 시 회원 정보 수정 요청 전에 
		// 새 비밀번호 입력 여부를 확인하여 새비밀번호 입력됐을 경우 암호화 수행 필요
		if(!map.get("mem_passwd").equals("")) {
			map.put("mem_passwd", passwordEncoder.encode(map.get("mem_passwd")));
			System.out.println("map : " + map); // passwd 항목 암호화 결과 확인
		}
		
		
		// MemberService - modifyMember() 메서드 호출하여 회원정보 수정 요청
		int updateCount = service.modifyMember(map);
		
		// 수정 요청 결과 판별 
		// 성공 시 "myInfo" 서블릿 주소 전달, 메세지 : 회원정보 수정 성공(success.jsp)
 		if(updateCount > 0) {
 			model.addAttribute("msg", "회원정보 수정 성공!");
 			model.addAttribute("targetURL", "myInfo");
 			return "result/successs";
 		}  else {
			model.addAttribute("msg", "회원정보 수정 실패!");
			return "result/fail";
 		}
		
	}
	
	
	
	
	
	
	
	// [ 회원 탈퇴 ]
	@GetMapping("MemberWithdraw")
	public String withdrawForm(MemberVO member, HttpSession session, Model model) {
		// 세션 아이디 없을 경우 "result/fail" 페이지 포워딩 처리
		// => "msg" 속성값 : "로그인 필수!"
		//	  "targetURL" 속성값 : "MemberLogin"(로그인 페이지)
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return "result/fail";
		}
		
		// -------------------------------------------------------------
		// MemberVO 객체에 세션 아이디 저장
		member.setMem_id(id);
		//--------------------------------------------------------
		// MemberService - withdrawMember() 메서드 호출하여 회원 탈퇴 작업 요청
		// => 파라미터 : MemberVO 리턴타입 : int(updateCount)
		int updateCount = service.withdrawMember(member);
		// 탈퇴 처리 후 결과값 처리 생략 
		System.out.println("updateCount : " + updateCount);
		// 로그인 정보 제거 위해 로그아웃 처리(세션 초기화) 후
		// "회원 탈되 완료!" 출력 후 메인페이지 포워딩 처리(success.jsp)
		
		System.out.println("id : " + id);
		
		session.invalidate();
		model.addAttribute("msg", "회원 탈퇴 완료!");
		model.addAttribute("targetURL", "./");
		return "result/success";
		
	}
	
	
}
