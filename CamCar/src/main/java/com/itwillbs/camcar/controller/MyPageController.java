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
import com.itwillbs.camcar.vo.CarModelVO;
import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;
import com.itwillbs.camcar.vo.PageInfo;
import com.itwillbs.camcar.vo.PayVO;
import com.itwillbs.camcar.vo.QnaVO;

@Controller
public class MyPageController {
	@Autowired
	private MyPageService service;
	
	// [ 마이페이지 ]
		// "MemberInfo" 서블릿 주소 매핑 - GET
	@GetMapping("MemberInfo")
	public String memberInfo(MemberVO member, HttpSession session, Model model,
			@RequestParam Map<String, String> map, CarModelVO carModel, PayVO payInfo){
			 System.out.println("지점 : " + map.get("brc_rent_name"));
			 System.out.println("대여일시 : " + map.get("res_rental_date"));
			 System.out.println("반납일시 : " + map.get("res_return_date"));
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
		
		//마이페이지 예약내역 조회
		List<Map<String, String>> ReserveList= service.getReserveList(id);
		System.out.println("ReserveList : " + ReserveList);
		
		MemberVO memberList = service.getMember(member);
		System.out.println("memberlist 정보 : " + memberList);
////		member = service.getMember(member);
//		MemberVO dbMember = service.getMember(member);
//		member.setMem_id(id);
//		// Model 객체에 MemberVO 객체 저장 후 member/member_info.jsp 페이지 포워딩
//				model.addAttribute("member", member);
		model.addAttribute("ReserveList", ReserveList);
		model.addAttribute("memberList", memberList);
		return "mypage/mypage";
	}
	
//-------------------------------------------------------------------------------------	
	
	// [마이페이지 - 예약내역 조회  ]
	
	
	
	
	
	
	
	
//--------------------------------------------------------------------------------------	
	
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
	
	@GetMapping("MyQuestionDetail")
	public String myQuestionDetail(int qna_number, Model model) {
		
		QnaVO qna = service.getMyQna(qna_number);
		
		// 조회 결과가 없을 경우 "존재하지 않는 게시물입니다" 출력 및 이전페이지 돌아가기 처리
		if(qna == null) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다");
			return "result/fail";
		}
		
		// Model 객체에 조회 결과 저장
		model.addAttribute("qna", qna);
		
		return "mypage/mypage_qna_detail";
	}
	
	// 나의 1:1 문의글 삭제
	@GetMapping("MyQuestionDelete")
	public String myQuestionDelete(
			int qna_number, @RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model) {
		
		QnaVO qna = service.getMyQna(qna_number);
		String id = (String)session.getAttribute("sId");
		
		if(id == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return "result/fail";
		}
		
		if(qna == null || !id.equals(qna.getMem_id())) {
			model.addAttribute("msg", "로그인 필수!");
			return "result/fail";
		}
		
		int deleteCount = service.removeMyQna(qna_number);
		
		// 삭제 결과 판별하여 처리
		if(deleteCount > 0) {
			model.addAttribute("msg", "삭제 성공!");
			model.addAttribute("targetURL", "MyQuestionList?pageNum=" + pageNum);
			return "result/success";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "result/fail";
		}
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
		System.out.println("map.get('mem_post_code') : " + map.get("mem_post_code"));
		System.out.println("map111 : " + map);
		System.out.println("member111 : " + member);
		
		//MemberService - getMember() 메서드 재사용하여 회원 상세정보 조회 요청
		// => 조회된 상세정보의 암호화 된 패스워드와 입력받은 기존 패스워드 비교 
		// 만약, 두 패스워드가 다르면, "수정권한이 없습니다!" 출력 
		member = service.getMember(member);
		
		System.out.println("member222 : " + member);
		
//		if(!passwordEncoder.matches(map.get("oldPasswd"), member.getMem_passwd())) { // 패스워드 불일치 
//			model.addAttribute("msg", "수정 권한이 없습니다!");
//			System.out.println("member : " + member);
//			return "result/fail";
//		}
		//------------------------------------------------------------------------------
//		 기존 비밀번호 일치 시 회원 정보 수정 요청 전에 
//		 새 비밀번호 입력 여부를 확인하여 새비밀번호 입력됐을 경우 암호화 수행 필요
		if(!map.get("mem_passwd").equals("")) {
			map.put("mem_passwd", passwordEncoder.encode(map.get("mem_passwd")));
		}
		System.out.println("map222 : " + map); // passwd 항목 암호화 결과 확인
		
		// MemberService - modifyMemPasswd() 메서드 호출하여 비밀번호 변경 요청
		int updateCount1 = service.modifyMemPasswd(map);
		// MemberService - modifyMemAdd() 메서드 호출하여 주소 변경 요청
//		int updateCount2 = service.modifyMemAdd(map);
		
		// 수정 요청 결과 판별 
		// 성공 시 "myInfo" 서블릿 주소 전달, 메세지 : 회원정보 수정 성공(success.jsp)
 		if(updateCount1 > 0) {
// 			if(updateCount1 > 0 || updateCount2 > 0) {
 			model.addAttribute("msg", "회원정보 수정 성공!");
 			model.addAttribute("targetURL", "myInfo");
 			return "result/success";
 		}  else {
			model.addAttribute("msg", "회원정보 수정 실패!");
			return "result/fail";
 		}
		
	}
	
	// [내 정보관리 주소 수정]
	@PostMapping("AddModify")
	public String addModify(@RequestParam Map<String,String> map, MemberVO member, Model model) {
		//MemberService - getMember() 메서드 재사용하여 회원 상세정보 조회 요청
		member= service.getMember(member);
		System.out.println("AddModify(member) : " + member);
		
		// MemberService - modifyMemAdd() 메서드 호출하여 주소 변경 요청
		
		int updateAddCount = service.modifyMemAdd(map);
		// 수정 요청 결과 판별
		// 성공 시"AddModify" 서블릿 주소 전달, 메세지 :  회원정보 수정 성공success.jsp)
		if(updateAddCount > 0) {
			model.addAttribute("msg", "회원 주소정보 수정 성공!");
			model.addAttribute("targetURL", "myInfo");
			return "result/success";
		} else {
			model.addAttribute("msg", "회원 주소정보 수정 실패!");
			return "result/fail";
		}
	}
	
	// [내 운전면허 정보 수정]
	@PostMapping("LicModify")
	public String licModify(@RequestParam Map<String,String> map, DriverVO driver, Model model, HttpSession session) {
		System.out.println("LicModify(driver) : " + driver);
		
		String id = (String)session.getAttribute("sId");
		driver = service.getDriver(driver, id);
		
		// MyPageService - modifyLicInfo() 메서드 호출하여 면허정보 변경 요청
		int updateLicCount = service.modifyLicInfo(map);
		// 수정 요청 결과 판별 
		// 성공 시 "myInfo" 서블릿 주소 전달, 메세지 : 회원정보 수정 성공(success.jsp)
		System.out.println("updateLicCount : " + updateLicCount);
		if(updateLicCount > 0) {
			//		 			if(updateCount1 > 0 || updateCount2 > 0) {
			model.addAttribute("msg", "회원 운전면허 정보 수정 성공!");
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
