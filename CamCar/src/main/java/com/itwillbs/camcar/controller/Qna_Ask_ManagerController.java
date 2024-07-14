package com.itwillbs.camcar.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.Qna_Ask_ManagerService;
import com.itwillbs.camcar.vo.PageInfo;
import com.itwillbs.camcar.vo.QnaVO;

@Controller
public class Qna_Ask_ManagerController {
	@Autowired
	private Qna_Ask_ManagerService service;
	
	// [ 글 목록 비즈니스 로직 ]
	@GetMapping("qna_ask")
	public String qnaAsk(
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
		System.out.println(listCount);
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
			model.addAttribute("targetURL", "qna_ask?pageNum=1");
			return "result/fail";
		}
		// --------------------------------------------------------------------
		// BoardService - getBoardList() 메서드 호출하여 게시물 목록 조회 요청
		// => 파라미터 : 검색타입, 검색어, 시작행번호, 게시물 수
		// => 리턴타입 : List<BoardVO>(boardList)
//		List<Map<String, Object>> qnaList = service.getQnaList(searchType, searchKeyword, startRow, listLimit);
		List<QnaVO> qnaList = service.getQnaList(searchType, searchKeyword, startRow, listLimit);
//		System.out.println(boardList);
		// --------------------------------------------------------------------
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		// --------------------------------------------------------------------
		// 게시물 목록과 페이징 정보를 Model 객체에 저장
		model.addAttribute("qnaList", qnaList);
		model.addAttribute("pageInfo", pageInfo);
		
		
		return"board/qna_manage_list";
	}
	
	// 1:1 문의 게시글 상세보기
	@GetMapping("QnaDetail")
	public String qnaDetail(int qna_number, Model model) {
		
		QnaVO qna = service.getQna(qna_number);
		System.out.println(qna);
		
		// 조회 결과가 없을 경우 "존재하지 않는 게시물입니다" 출력 및 이전페이지 돌아가기 처리
		if(qna == null) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다");
			return "result/fail";
		}
		
		// Model 객체에 조회 결과 저장
		model.addAttribute("qna", qna);
		
		return "board/qna_detail_form";
	}
 	
	@GetMapping("QnaReply")
	public String qnaReply(int qna_number, Model model) {
		QnaVO qna = service.getQna(qna_number);
		
		model.addAttribute("qna", qna);
		
		return "board/qna_reply_form";
	}
	
	@PostMapping("QnaReplyPro")
	public String qnaReplyPro(QnaVO qna, 
			@RequestParam int qna_number,
			@RequestParam(defaultValue = "1") String pageNum,
			Model model) {
		QnaVO dbQna = service.getQna(qna_number);
		
		System.out.println("qna : " + qna);
		System.out.println("dbQna : " + dbQna);
		int updateCount = service.modifyQna(dbQna);
		
		if(updateCount > 0) {
			// 글 상세정보 조회 페이지 리다이렉트(파라미터 : 글번호, 페이지번호)
			return "redirect:/QnaDetail?qna_number=" + qna_number + "&pageNum=" + pageNum;
		} else {
			model.addAttribute("msg", "답변 실패!");
			return "result/fail";
		}
	}
	
	@GetMapping("QnaDelete")
	public String qnaDelete(
			int qna_number, @RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model) {
		
		
		QnaVO qna = service.getQna(qna_number);
		String id = (String)session.getAttribute("sId");
		
		System.out.println(qna);
		
		if(qna == null || !id.equals("admin")) {
			model.addAttribute("msg", "관리자가 아닙니다!");
			return "result/fail";
		}
		
		int deleteCount = service.removeQna(qna_number);
		
		// 삭제 결과 판별하여 처리
		if(deleteCount > 0) {
			model.addAttribute("msg", "삭제 성공!");
			model.addAttribute("targetURL", "qna_ask?pageNum=" + pageNum);
			return "result/success";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "result/fail";
		}
		
	}
	
	
	
	
}
