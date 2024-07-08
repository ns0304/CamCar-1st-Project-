package com.itwillbs.camcar.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.Member_ManageService;
import com.itwillbs.camcar.vo.MemberVO;
import com.itwillbs.camcar.vo.PageInfo;

@Controller
public class Member_ManageController {
	@Autowired
	private Member_ManageService service;
	
	@GetMapping("member_management")
	public String member(MemberVO member, HttpSession session, Model model,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum) {
//		List<MemberVO> MemberList = service.getManagerMember(member);
//		System.out.println(MemberList);
//		model.addAttribute("MemberList", MemberList);
		System.out.println("검색타입 : " + searchType);
		System.out.println("검색어 : " + searchKeyword);
		System.out.println("페이지번호 : " + pageNum);
		System.out.println(member.getMem_status());
		
		int listLimit = 5;
		int startRow = (pageNum - 1) * listLimit;
		int listCount = service.getMemberListCount(searchType, searchKeyword);
		int pageListLimit = 3;
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit - 1;
		if(maxPage == 0) {
			maxPage = 1;
		}
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		if(pageNum < 1 || pageNum > maxPage) {
			model.addAttribute("msg", "해당 페이지는 존재하지 않습니다!");
			model.addAttribute("targetURL", "member_management?pageNum=1");
			return "result/fail";
		}
		List<MemberVO> memberList = service.getMemberList(searchType, searchKeyword, startRow, listLimit);
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		model.addAttribute("memberList", memberList);
		model.addAttribute("pageInfo", pageInfo);
		
		return"member/member_manager_main";
		
	}
}
