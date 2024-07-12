package com.itwillbs.camcar.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.Member_ManageService;
import com.itwillbs.camcar.vo.MemberVO;
import com.itwillbs.camcar.vo.PageInfo;

@Controller
public class Member_ManageController {
	@Autowired
	private Member_ManageService service;
	
	// [ 글 목록 비즈니스 로직 ]
	@GetMapping("memberList")
	public String member(MemberVO member, HttpSession session, Model model,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum) {
		System.out.println("검색타입 : " + searchType);
		System.out.println("검색어 : " + searchKeyword);
		System.out.println("페이지번호 : " + pageNum);
		System.out.println(member.getMem_status());
		// 페이징 처리를 위해 조회 목록 갯수 조절에 사용될 변수 선언
		int listLimit = 8;
		int startRow = (pageNum - 1) * listLimit;
		// 페이징 처리를 위한 계산 작업
		// MemberListService - getMemberListCount() 메서드 호출하여 전체 게시물 수 조회 요청
		int listCount = service.getMemberListCount(searchType, searchKeyword);
		int pageListLimit = 3;
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
		// 전달받은 페이지번호가 1보다 작거나 최대 페이지번호보다 클 경우
		// "해당 페이지는 존재하지 않습니다!" 출력 및 1페이지로 이동하도록 처리
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "해당 페이지는 존재하지 않습니다!");
			model.addAttribute("targetURL", "memberList?pageNum=1");
			return "result/fail";
		}
		List<MemberVO> memberList = service.getMemberList(searchType, searchKeyword, startRow, listLimit);
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageInfo);
		
		return"member/member_manager_main";
		
	}
	//회원 상세정보 조회
	@GetMapping("MemberInf")
	public String boardDetail(MemberVO member, Model model) {
		
		// 조회 결과가 없을 경우 "존재하지 않는 게시물입니다" 출력 및 이전페이지 돌아가기 처리
		if(member == null) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다");
			return "result/fail";
		}
		List<MemberVO> memberInfoDetail = service.getMemberInfoDetail();
		// Model 객체에 조회 결과 저장
		System.out.println("member상세 정보" + memberInfoDetail);
		model.addAttribute("memberInfoDetail", memberInfoDetail);
		
		return"member/member_inf";
	}
	
	
	
}
