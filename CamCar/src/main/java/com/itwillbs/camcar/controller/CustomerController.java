package com.itwillbs.camcar.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.itwillbs.camcar.service.CustomerService;
import com.itwillbs.camcar.vo.BoardVO;
import com.itwillbs.camcar.vo.PageInfo;
import com.itwillbs.camcar.vo.QnaVO;

@Controller
public class CustomerController {
	@Autowired
	private CustomerService service;
	
	// 고객센터 페이지
	// http://localhost:8081/camcar/Customer
	@GetMapping("Customer")
	public String customer(Model model) {
		
		List<BoardVO> boardList3 = service.getBoardList3();
		System.out.println(boardList3);
		// --------------------------------------------------------------------
		// 게시물 목록과 페이징 정보를 Model 객체에 저장
		model.addAttribute("boardList3", boardList3);
		
		return "customer/customer_list";
	}
	
	// 공지사항 페이지
	// http://localhost:8081/camcar/board_list
	@GetMapping("board_list")
	public String board(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model) {
//		System.out.println("검색타입 : " + searchType);
//		System.out.println("검색어 : " + searchKeyword);
//		System.out.println("페이지번호 : " + pageNum);
		// --------------------------------------------------------------------
		// 페이징 처리를 위해 조회 목록 갯수 조절에 사용될 변수 선언
		int listLimit = 5; // 페이지 당 게시물 수
		int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 행 번호
		
		// 페이징 처리를 위한 계산 작업
		// BoardListService - getBoardListCount() 메서드 호출하여 전체 게시물 수 조회 요청
		// => 파라미터 : 검색타입, 검색어   리턴타입 : int(listCount)
		int listCount = service.getBoardListCount(searchType, searchKeyword);
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
			model.addAttribute("targetURL", "board_list?pageNum=1");
			return "result/fail";
		}
		// --------------------------------------------------------------------
		// BoardService - getBoardList() 메서드 호출하여 게시물 목록 조회 요청
		// => 파라미터 : 검색타입, 검색어, 시작행번호, 게시물 수
		// => 리턴타입 : List<BoardVO>(boardList)
		List<BoardVO> boardList = service.getBoardList(searchType, searchKeyword, startRow, listLimit);
		System.out.println(boardList);
		// --------------------------------------------------------------------
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		// --------------------------------------------------------------------
		// 게시물 목록과 페이징 정보를 Model 객체에 저장
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageInfo", pageInfo);
	
		return "board/board_list";
	}
	
	// 공지사항 상세보기 페이지
	@GetMapping("boardDetail")
	public String boardDetail(int bo_idx, Model model) {
		
		BoardVO bo = service.getBoard(bo_idx, true);
		
		if(bo == null) {
			model.addAttribute("msg", "존재하지 않는 게시물입니다");
			return "result/fail";
		}
		
		// Model 객체에 조회 결과 저장
		model.addAttribute("bo", bo);
		
		return "board/board_view";
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
			model.addAttribute("msg", "1:1문의 등록 완료");
			model.addAttribute("targetURL", "Customer");
			return "result/success";
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
	
	
	// -----------------------------------
	// 서비스 페이지 매핑
	@GetMapping("Service")
	public String service() {
		return "customer/service";
	}
	
	
}

















