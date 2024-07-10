package com.itwillbs.camcar.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;
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

import com.itwillbs.camcar.service.Car_ManageService;
import com.itwillbs.camcar.vo.BoardVO;
import com.itwillbs.camcar.vo.CarVO;
import com.itwillbs.camcar.vo.PageInfo;

@Controller
public class Car_ManageController {
	@Autowired
	private Car_ManageService service;
	
	// 가상의 경로명 저장(이클립스 프로젝트 상의 경로)
	private String uploadPath = "/resources/upload"; 

	@GetMapping("CarListWrite")
	public String carWriteForm(HttpSession session, Model model, HttpServletRequest request) {
		return "car/new_car_manager_main";
	}
	// [ 글쓰기 비즈니스 로직 처리 ] 
	
	@PostMapping("CarListWrite")
	public String carWritePro(CarVO car, HttpServletRequest request, HttpSession session, Model model) {
		// 작성자 IP 주소 가져와서 BoardVO 객체에 저장
//		String realPath = session.getServletContext().getRealPath(uploadPath); // 가상의 경로 전달
//		// [ 경로 관리 ]
//		String subDir = ""; // 하위 디렉토리명을 저장할 변수 선언
//		
//		// 파일 업로드 시점에 맞는 날짜별 서브디렉토리 생성
//		LocalDate today = LocalDate.now();
//		// 2. 날짜 포맷을 디렉토리 형식에 맞게 변경
//		String datePattern = "yyyy/MM/dd"; // 형식 변경에 사용할 패턴 문자열 지정
//		// 2-2) LocalDate 타입 객체의 날짜 포맷 변경을 위해 java.time.format.DateTimeFormat 클래스 활용
//		DateTimeFormatter dtf = DateTimeFormatter.ofPattern(datePattern);
//		// 3. 지정한 포맷을 적용하여 날짜 형식 변경 결과 문자열을 경로 변수 subDir 에 저장
//		subDir = today.format(dtf); 
//		// -----------------
//		// 4. 기존 실제 업로드 경로에 서브 디렉토리(날짜 경로) 결합
//		realPath += "/" + subDir;
//		try {
//			Path path = Paths.get(realPath); 
//			
//			Files.createDirectories(path);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		// --------------------------------------------------------------------------------------
		// [ 업로드 되는 실제 파일 처리 ]
		// 실제 파일은 BoardVO 객체의 MultipartFile 타입 객체(멤버변수 fileX)가 관리함
//		MultipartFile mFile1 = car.getFile1();
//		MultipartFile mFile2 = car.getFile2();
//		MultipartFile mFile3 = car.getFile3();
//		MultipartFile mFile4 = car.getFile4();
//		MultipartFile mFile5 = car.getFile5();
//		
//		System.out.println("원본파일명1 : " + mFile1.getOriginalFilename());
//		System.out.println("원본파일명2 : " + mFile2.getOriginalFilename());
//		System.out.println("원본파일명3 : " + mFile3.getOriginalFilename());
//		System.out.println("원본파일명4 : " + mFile4.getOriginalFilename());
//		System.out.println("원본파일명5 : " + mFile5.getOriginalFilename());
//		String fileName1 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile1.getOriginalFilename();
//		String fileName2 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile2.getOriginalFilename();
//		String fileName3 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile3.getOriginalFilename();
//		String fileName4 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile4.getOriginalFilename();
//		String fileName5 = UUID.randomUUID().toString().substring(0, 8) + "_" + mFile5.getOriginalFilename();
//		
//		car.setBoard_file1("");
//		car.setBoard_file2("");
//		car.setBoard_file3("");
//		car.setBoard_file4("");
//		car.setBoard_file5("");
//		
//		if(!mFile1.getOriginalFilename().equals("")) {
//			car.setBoard_file1(subDir + "/" + fileName1);
//		}
//		
//		if(!mFile2.getOriginalFilename().equals("")) {
//			car.setBoard_file2(subDir + "/" + fileName2);
//		}
//		
//		if(!mFile3.getOriginalFilename().equals("")) {
//			car.setBoard_file3(subDir + "/" + fileName3);
//		}
//		if(!mFile4.getOriginalFilename().equals("")) {
//			car.setBoard_file4(subDir + "/" + fileName4);
//		}
//		if(!mFile5.getOriginalFilename().equals("")) {
//			car.setBoard_file5(subDir + "/" + fileName5);
//		}
		
		// BoardService - registBoard() 메서드 호출하여 게시물 등록 작업 요청
		// => 파라미터 : BoardVO 객체   리턴타입 : int(insertCount)
		System.out.println(car);
		int insertCount = service.registBoard(car);
		// 게시물 등록 작업 요청 결과 판별
		if(insertCount > 0) { // 성공
//			try {
//				if(!mFile1.getOriginalFilename().equals("")) {
//					mFile1.transferTo(new File(realPath, fileName1));
//				}
//				
//				if(!mFile2.getOriginalFilename().equals("")) {
//					mFile2.transferTo(new File(realPath, fileName2));
//				}
//				
//				if(!mFile3.getOriginalFilename().equals("")) {
//					mFile3.transferTo(new File(realPath, fileName3));
//				}
//				if(!mFile4.getOriginalFilename().equals("")) {
//					mFile4.transferTo(new File(realPath, fileName4));
//				}
//				if(!mFile5.getOriginalFilename().equals("")) {
//					mFile5.transferTo(new File(realPath, fileName5));
//				}
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
			
			// 글목록(BoardList) 서블릿 주소 리다이렉트
			return "redirect:/Carlist";
		} else { // 실패
			model.addAttribute("msg", "글쓰기 실패!");
			return "result/fail";
			}
			
		}
	@GetMapping("Carlist")
	public String CarListForm(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model) {
		return"car/car_manager_main";
	}
	
	
	@PostMapping("Carlist")
	public String CarList(
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model) {
		System.out.println("carlist");
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
		int listCount = service.getCarListCount(searchType, searchKeyword);
		int pageListLimit = 3; // 임시) 페이지 당 페이지 번호 갯수를 3개로 지정(1 2 3 or 4 5 6)
		int maxPage = listCount / listLimit + (listCount % listLimit > 0 ? 1 : 0);
		int startPage = (pageNum - 1) / pageListLimit * pageListLimit + 1;
		int endPage = startPage + pageListLimit -1;
		
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
		List<CarVO> carList = service.getCarList(searchType, searchKeyword, startRow, listLimit);
//		System.out.println(boardList);
		// --------------------------------------------------------------------
		PageInfo pageInfo = new PageInfo(listCount, pageListLimit, maxPage, startPage, endPage);
		// --------------------------------------------------------------------
		// 게시물 목록과 페이징 정보를 Model 객체에 저장
		model.addAttribute("carList", carList);
		model.addAttribute("pageInfo", pageInfo);
		
		return "car/car_manager_main";
	}
	
}
