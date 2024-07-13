package com.itwillbs.camcar.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.itwillbs.camcar.service.BoardService;
import com.itwillbs.camcar.vo.BoardVO;
import com.itwillbs.camcar.vo.PageInfo;

@Controller
public class BoardController {
	@Autowired
	private BoardService service;
	// 가상의 경로명 저장(이클립스 프로젝트 상의 경로)
	private String uploadPath = "/resources/upload"; 
	
	@GetMapping("BoardWrite")
	public String boardmanagerWriteForm(HttpSession session, Model model, HttpServletRequest request) {
		if(session.getAttribute("sId") == null) {
			model.addAttribute("msg", "로그인 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			String prevURL = request.getServletPath();
			if(request.getQueryString() != null) {
				prevURL += "?" + request.getQueryString();
			}
			session.setAttribute("prevURL", prevURL);
			return "result/fail";
		}
		
		return "board/board_write_form";
	}
	// [ 글쓰기 비즈니스 로직 처리 ] 
	@PostMapping("BoardWrite")
	public String boardmanagerWritePro(BoardVO bo, HttpServletRequest request, HttpSession session, Model model) {
		System.out.println(bo);
		String realPath = session.getServletContext().getRealPath(uploadPath); // 가상의 경로 전달
		String subDir = ""; // 하위 디렉토리명을 저장할 변수 선언
		LocalDate today = LocalDate.now();
		String datePattern = "yyyy/MM/dd"; // 형식 변경에 사용할 패턴 문자열 지정
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(datePattern);
		subDir = today.format(dtf); // LocalDate - DateTimeFormatter
		realPath += "/" + subDir;
		try {
			Path path = Paths.get(realPath); // 파라미터로 실제 업로드 경로 전달
			Files.createDirectories(path);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// --------------------------------------------------------------------------------------
		// [ 업로드 되는 실제 파일 처리 ]
		MultipartFile mFile1 = bo.getFile();
		// MultipartFile 객체의 getOriginalFile() 메서드 호출 시 업로드 한 원본 파일명 리턴
		System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
		// --------------------------------------------------------------------------------------
		// [ 파일명 중복 방지 대책 ]
		String fileName1 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile1.getOriginalFilename();
		
		// BoardService - registBoard() 메서드 호출하여 게시물 등록 작업 요청
		// => 파라미터 : BoardVO 객체   리턴타입 : int(insertCount)
		int insertCount = service.applyBoard(bo);
		
		// 게시물 등록 작업 요청 결과 판별
		if(insertCount > 0) { // 성공
			try {
				if(!mFile1.getOriginalFilename().equals("")) {
					mFile1.transferTo(new File(realPath, fileName1));
				}
				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 글목록(BoardList) 서블릿 주소 리다이렉트
			return "redirect:/BoardList";
		} else { 
			// "글쓰기 실패!" 메세지 출력 및 이전 페이지 돌아가기 처리
			model.addAttribute("msg", "글쓰기 실패!");
			return "result/fail";
		}
//		return "";
	}
		
	// ====================================================================
	// [ 글 목록 비즈니스 로직 ]
	@GetMapping("BoardList")
	public String boardmanagerList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model) {
//		System.out.println("검색타입 : " + searchType);
//		System.out.println("검색어 : " + searchKeyword);
//		System.out.println("페이지번호 : " + pageNum);
		// --------------------------------------------------------------------
		// 페이징 처리를 위해 조회 목록 갯수 조절에 사용될 변수 선언
		int listLimit = 10; // 페이지 당 게시물 수
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
			model.addAttribute("targetURL", "BoardList?pageNum=1");
			return "result/fail";
		}
		// --------------------------------------------------------------------
		// BoardService - getBoardList() 메서드 호출하여 게시물 목록 조회 요청
		// => 파라미터 : 검색타입, 검색어, 시작행번호, 게시물 수
		// => 리턴타입 : List<BoardVO>(boardList)
		List<BoardVO> boardList = service.getBoardList(searchType, searchKeyword, startRow, listLimit);
//		System.out.println(boardList);
		// --------------------------------------------------------------------
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		// --------------------------------------------------------------------
		// 게시물 목록과 페이징 정보를 Model 객체에 저장
		model.addAttribute("boardList", boardList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "board/board_manager_list";
	}

		
	
	
	
		
		
	}
	
	















