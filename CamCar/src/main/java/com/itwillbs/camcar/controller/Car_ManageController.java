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
import com.itwillbs.camcar.vo.CarModelVO;
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
		return "car/registration_car_manager_main";
	}
	// [ 차량 정보 등록 ] 
	
	// *******************************************************************
	// 최짐니 작업
	// [ 차량 모델 정보(car_model_info) 등록 작업 ]
	@GetMapping("CarInfoRegistration")
	public String carInfoRegistration(HttpSession session, Model model, HttpServletRequest request) {
		return "car/registration_car_manager_main";
	}
	
	@PostMapping("CarInfoRegistration")
	public String carInfoRegistrationPro(CarVO car, HttpServletRequest request, HttpSession session, Model model) {
		
		System.out.println(car);
		System.out.println("차량코드 : " + car.getBrc_idx());
//		System.out.println(carModel);
//		System.out.println("모델명 : " + carModel.getCar_model());
//		int insertCount = service.registCarModel(carModel);
//		if(insertCount > 0) { // 성공
//			return "redirect:/Carlist";
//		} else { // 실패
//			model.addAttribute("msg", "차량 정보 등록 실패!");
//			return "result/fail";
//		}
		return "";
	}
	// *******************************************************************
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
