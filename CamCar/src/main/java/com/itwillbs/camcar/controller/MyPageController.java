package com.itwillbs.camcar.controller;

import java.io.Console;
import java.util.List;
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
import com.itwillbs.camcar.vo.PageInfo;
import com.itwillbs.camcar.vo.QnaVO;

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
	
	
	
	
	
	
	
	// [ 나의 1:1문의 게시글 목록]
	@GetMapping("MyQuestionList")
	public String myQuestionList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model) {
		
		System.out.println("검색타입 : " + searchType);
		System.out.println("검색어 : " + searchKeyword);
		System.out.println("페이지번호 : " + pageNum);
		// --------------------------------------------------------------------
		// 페이징 처리를 위해 조회 목록 갯수 조절에 사용될 변수 선언
		int listLimit = 10; // 페이지 당 게시물 수
		int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 행 번호
		System.out.println("startRow : " + startRow);
		// 페이징 처리를 위한 계산 작업
		// BoardListService - getBoardListCount() 메서드 호출하여 전체 게시물 수 조회 요청
		// => 파라미터 : 검색타입, 검색어   리턴타입 : int(listCount)
		int listCount = service.getQnaListCount(searchType, searchKeyword);
		int pageListLimit = 3; // 임시) 페이지 당 페이지 번호 갯수를 3개로 지정(1 2 3 or 4 5 6)
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		
		// 최대 페이지번호(maxPage) 값의 기본값을 1로 설정하기 위해 계산 결과가 0 이면 1 로 변경
		if(maxPage == 0) {
			maxPage = 1;
		}
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		// --------------------------------------------------------------------
		// 전달받은 페이지번호가 1보다 작거나 최대 페이지번호보다 클 경우
		// "해당 페이지는 존재하지 않습니다!" 출력 및 1페이지로 이동하도록 처리
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "해당 페이지는 존재하지 않습니다!");
			model.addAttribute("targetURL", "MyQuestionList?pageNum=1");
			return "result/fail";
		}
		// --------------------------------------------------------------------
		// BoardService - getBoardList() 메서드 호출하여 게시물 목록 조회 요청
		// => 파라미터 : 검색타입, 검색어, 시작행번호, 게시물 수
		// => 리턴타입 : List<BoardVO>(boardList)
		List<QnaVO> qnaList = service.getQnaList(searchType, searchKeyword, startRow, listLimit);
//		System.out.println(boardList);
		// --------------------------------------------------------------------
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		// --------------------------------------------------------------------
		// 게시물 목록과 페이징 정보를 Model 객체에 저장
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "mypage/myquestion_list";
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
	public String myInfoModify(@RequestParam Map<String, String> map, MemberVO member, BCryptPasswordEncoder passwordEncoder, Model model) {
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
//			System.out.println("member : " + member);
//			return "result/fail";
//		}
		//------------------------------------------------------------------------------
		// 기존 비밀번호 일치 시 회원 정보 수정 요청 전에 
		// 새 비밀번호 입력 여부를 확인하여 새비밀번호 입력됐을 경우 암호화 수행 필요
		if(!map.get("mem_passwd").equals("")) {
			map.put("mem_passwd", passwordEncoder.encode(map.get("mem_passwd")));
			System.out.println("map : " + map); // passwd 항목 암호화 결과 확인
		}
		map.put("mem_post_code", map.get("mem_post_code"));
		map.put("mem_add1", map.get("mem_add1"));
		map.put("mem_add2", map.get("mem_add2"));
		
		// MemberService - modifyMember() 메서드 호출하여 회원정보 수정 요청
		int updateCount = service.modifyMember(map);
		
		// 수정 요청 결과 판별 
		// 성공 시 "myInfo" 서블릿 주소 전달, 메세지 : 회원정보 수정 성공(success.jsp)
 		if(updateCount > 0) {
 			model.addAttribute("msg", "회원정보 수정 성공!");
 			model.addAttribute("targetURL", "myInfo");
 			return "result/success";
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
