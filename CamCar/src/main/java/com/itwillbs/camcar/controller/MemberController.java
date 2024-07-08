package com.itwillbs.camcar.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.MemberService;
import com.itwillbs.camcar.vo.DriverVO;
import com.itwillbs.camcar.vo.MemberVO;

@Controller
public class MemberController {
	@Autowired
	private MemberService service;
	
	// 회원가입폼 페이지
	// http://localhost:8081/camcar/MemberJoin
	@GetMapping("MemberJoin")
	public String join() {
		return "member/member_join_form";
	}
	
	// 회원가입2
	@PostMapping("MemberJoinPro")
	public String joinPro(MemberVO member, Model model, BCryptPasswordEncoder passwordEncoder, DriverVO drivers) {
		member.setMem_email(member.getMem_email1() + "@" + member.getMem_email2());
//		System.out.println(member);
		
		// 평문(원문) 패스워드에 대한 해싱(Hashing = 단방향 암호화) 수행 후 결과값 문자열로 저장
		String securePasswd = passwordEncoder.encode(member.getMem_passwd());
//		System.out.println("평문 : " + member.getMem_passwd());
//		System.out.println("암호문 : " + securePasswd);
		
		// 암호화 된 패스워드를 다시 MemberVO 객체의 passwd 값에 저장(덮어쓰기)
		member.setMem_passwd(securePasswd);
		
		
		int insertCount = service.registMember(member);
		int insertCount2 = service.registDriver(drivers);
		
		// 회원가입 성공/실패에 따른 페이징 처리
		// 성공 시 : "MemberJoinSuccess" 서블릿 주소 리다이렉트
		// 실패 시 : "result_process/fail.jsp" 페이지 포워딩("msg" 속성값 : "회원가입 실패!")
		if(insertCount > 0 || insertCount2 > 0) {
			return "redirect:/MemberJoinSuccess";
		} else {
			model.addAttribute("msg", "회원가입 실패!");
			return "result/fail";
		}
		
//		return "member/member_join_success";
		
	}
	
	// 아이디 중복 확인폼
	@GetMapping ("MemberCheckId")
	public String memberCheckId() {
		return "member/check_id";
	}
	
	// 아이디 중복 확인 버튼
	@PostMapping("MemberCheckIdPro")
	public String memberCheckIdPro() {
		return "";
	}
	
	
	// 회원가입 완료
	@GetMapping("MemberJoinSuccess")
	public String joinPro_success() {
		return "member/member_join_success";
	}
	
	
	// 로그인 페이지
	// http://localhost:8081/camcar/MemberLogin
	@GetMapping("MemberLogin")
	public String login() {
		return "member/member_login_form";
	}
	
	// 로그인 성공창(메인)
	// http://localhost:8080/camcar/MemberLoginPro
	@PostMapping("MemberLoginPro")
	public String memberLoginPro(MemberVO member, Model model, HttpSession session,
								BCryptPasswordEncoder passwordEncoder) {
		
		MemberVO dbMember = service.getMember(member);
//		System.out.println(dbMember);
//		System.out.println(member);
		
		if(dbMember == null || !passwordEncoder.matches(member.getMem_passwd(), dbMember.getMem_passwd())) {
			model.addAttribute("msg", "로그인 실패!");
			return "result/fail";
			
//		} else if(dbMember.getMem_status() == 3) { // 로그인 성공(이지만 탈퇴 회원인 경우)
//			model.addAttribute("msg", "탈퇴한 회원입니다!");
//			return "result/fail";
			
		} else { // 로그인 성공
			// 로그인 성공한 아이디를 세션에 저장
			session.setAttribute("sId", member.getMem_id());
			
			// 세션 타이머 1시간으로 변경
			session.setMaxInactiveInterval(60 * 60); // 60초 * 60분 = 3600
			
//			if(session.getAttribute("prevURL") == null) {
//				return "redirect:/";
//			} else {
//				// 요청 서블릿 주소 앞에 "/" 기호가 이미 붙어있으므로 "redirect:" 문자열과 결합
//				return "redirect:" + session.getAttribute("prevURL");
//			}
			
			if(dbMember.getMem_id().equals("admin")) {
				return "manager_main";
			}
			// ㅎㅎㅎㅎㅎ
		}
	}
	
	// 로그아웃
	// http://localhost:8080/camcar/MemberLogout
	@GetMapping("MemberLogout")
	public String memberLogout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	// 아이디 찾기 페이지
	// http://localhost:8080/camcar/Id_find
	@GetMapping("Id_find") 
	public String id_find() {
		return "member/member_id_find";
	}
	
//	// 아이디 찾기2 페이지
//	// http://localhost:8080/camcar/IdFindPro
	@PostMapping("IdFindPro")
	public String id_find_pro(MemberVO member, Model model, String mem_tel) {
//		member.setMem_id((String)session.getAttribute("sId"));
//		System.out.println("member : " + member);
		
		MemberVO dbMember = service.isExistTel(mem_tel);
		
		if(dbMember == null) { // !member.getMem_tel().equals(mem_tel)
			model.addAttribute("msg", "없는 전화번호입니다");
			return "result/fail";
			
		} else {
			model.addAttribute("dbMember", dbMember); // model에 전화번호 값 저장
			return "member/member_id_find_pro";
		}
		
//		return "member/member_id_find_pro";
	}
	
	// 비밀번호 찾기 페이지
	// http://localhost:8080/camcar/Passwd_find
	@GetMapping("Passwd_find") 
	public String passwd_find() {
		return "member/member_pw_find";
	}
	
	// 비밀번호 찾기2 페이지
	// http://localhost:8080/camcar/PwFindPro
	@PostMapping("PwFindPro")
	public String pw_find_pro(MemberVO member, Model model, String mem_id) {
		
		MemberVO dbMember = service.isExistId(mem_id);
		
		if(dbMember == null) { // !member.getMem_tel().equals(mem_tel)
			model.addAttribute("msg", "없는 아이디입니다");
			return "result/fail";
			
		} else {
			model.addAttribute("dbMember", dbMember); // model에 아이디값 저장
			return "member/member_pw_find_pro";
		}
		
//		return "member/member_pw_find_pro";
	}
	
	// 전화번호로 비밀번호 찾기
	@PostMapping("PwResetPro")
	public String pwResetPro(MemberVO member,String mem_tel, Model model) {
		
		MemberVO dbMember = service.isExistTel(mem_tel);
		
		if(dbMember == null) { // !member.getMem_tel().equals(mem_tel)
			model.addAttribute("msg", "없는 전화번호입니다");
			return "result/fail";
			
		} else {
			model.addAttribute("dbMember", dbMember); // model에 전화번호값 저장
			return "member/member_pw_reset";
		}
		
//		return "member/member_pw_find";
	}
	
//	// 비밀번호 재설정
//	@PostMapping("PwRestFinal")
//	public String pwResetFinal(@RequestParam Map<String, String> map, MemberVO member
//								, BCryptPasswordEncoder passwordEncoder, Model model) {
//		
//		member = service.getMember(member); // // map이 있으니까 member에 덮어씌워도 상관없다
//		
//		// MemberService - getMember() 메서드 재사용하여 회원 상세정보 조회 요청
//		// => 조회된 상세정보의 암호화 된 패스워드와 입력받은 기존 패스워드 비교
//		if(!passwordEncoder.matches(map.get("oldMem_passwd"), member.getMem_passwd())) { // 패스워드 불일치시
//			model.addAttribute("msg", "수정 권한이 없습니다!");
//			return "result/fail";
//		}
//		
//		// 새 비밀번호 입력 여부를 확인하여 새 비밀번호 입력됐을 경우 암호화 수행 필요
//		if(!map.get("mem_passwd").equals("")) { // 널스트링이 아니면 새 비밀번호 암호화 수행
//			map.put("mem_passwd", passwordEncoder.encode(map.get("mem_passwd")));
////			System.out.println("map : " + map); // passwd 항목 암호화 결과 확인
//		}
//		
//		
//		return "member/member_pw_reset_final";
//	}
	
	@GetMapping("MemberInfo")
	public String memberInfo() {
		return "mypage/mypage";
	}
}




























