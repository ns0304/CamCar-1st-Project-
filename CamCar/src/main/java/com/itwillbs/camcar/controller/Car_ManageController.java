package com.itwillbs.camcar.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
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
	
	// *******************************************************************
	// 최짐니 작업
	// [ 차량 정보(car_info) 등록 작업 ]
	@GetMapping("CarInfoRegistration")
	public String carInfoRegistration(HttpSession session, Model model, HttpServletRequest request) {
		return "car/registration_car";
	}
	
	@PostMapping("CarInfoRegistration")
	public String carInfoRegistrationPro(CarModelVO carModel, CarVO car, HttpServletRequest request, HttpSession session, Model model) {
		System.out.println(carModel);
		System.out.println(car);
		
		
		String realPath1 = session.getServletContext().getRealPath(uploadPath); // 가상의 경로 전달
		String subDir1 = ""; // 하위 디렉토리명을 저장할 변수 선언
		String realPath2 = session.getServletContext().getRealPath(uploadPath); // 가상의 경로 전달
		String subDir2 = ""; // 하위 디렉토리명을 저장할 변수 선언
		
		// carModel 이미지 등록 - 모델명 별 서브디렉토리 생성
		subDir1 = "carModel" + "/" + carModel.getCar_model();
		// car 이미지 등록 - 모델명/차량번호 별 서브디렉토리 생성
		subDir2 = "car" + "/" + car.getCar_model() + "/" + car.getCar_number();
		// 기존 실제 업로드 경로에 서브 디렉토리(모델명 경로) 결합
		realPath1 += "/" + subDir1;
		realPath2 += "/" + subDir2;
		
		System.out.println("realPath1 : " + realPath1);
		// => realPath1 : D:\itwill\Spring\workspace_spring5\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\CamCar\resources\ upload/레이
		System.out.println("realPath2 : " + realPath2);
		// => realPath2 : D:\itwill\Spring\workspace_spring5\.metadata\.plugins\org.eclipse.wst.server.core\tmp0\wtpwebapps\CamCar\resources\ upload/119나3857
		
		try {
			// 해당 디렉토리를 실제 경로에 생성(단, 존재하지 않을 경우에만 자동 생성)
			Path path1 = Paths.get(realPath1); // 파라미터로 실제 업로드 경로 전달
			Files.createDirectories(path1);	// 실제 경로 생성
			Path path2 = Paths.get(realPath2); // 파라미터로 실제 업로드 경로 전달
			Files.createDirectories(path2);	// 실제 경로 생성
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		// ---------------------------------------------------------------------------------
		// 실제 업로드 되는 파일 처리
		MultipartFile mModelImg = carModel.getModel_image();
		MultipartFile mLogoImg = carModel.getLogo_image();
		
		MultipartFile mCarImg1 = car.getImage1();
		MultipartFile mCarImg2 = car.getImage2();
		MultipartFile mCarImg3 = car.getImage3();
		MultipartFile mCarImg4 = car.getImage4();
		MultipartFile mCarImg5 = car.getImage5();
		
		// MultipartFile 객체의 getOriginalFile() 메서드 호출 시 업로드 한 원본 파일명 리턴
		// => 주의! 업로드 파일이 존재하지 않으면 파일명에 null 값이 아닌 널스트링값 저장됨
		System.out.println("차량모델사진 : " + mModelImg.getOriginalFilename());
		System.out.println("제조사로고사진 : " + mLogoImg.getOriginalFilename());
		
		System.out.println("차량상세사진1 : " + mCarImg1.getOriginalFilename());
		System.out.println("차량상세사진2 : " + mCarImg2.getOriginalFilename());
		System.out.println("차량상세사진3 : " + mCarImg3.getOriginalFilename());
		System.out.println("차량상세사진4 : " + mCarImg4.getOriginalFilename());
		System.out.println("차량상세사진5 : " + mCarImg5.getOriginalFilename());
		
		
		// 파일명 저장 전 CarModelVO 객체의 파일명에 해당하는 멤버변수값을 널스트링("") 으로 변경
		carModel.setCar_model_image("");
		carModel.setCar_logo_image("");
		car.setCar_image1("");
		car.setCar_image2("");
		car.setCar_image3("");
		car.setCar_image4("");
		car.setCar_image5("");
		
		
		if(!mModelImg.getOriginalFilename().equals("")) {
			carModel.setCar_model_image(subDir1 + "/" + mModelImg.getOriginalFilename());
		}
		if(!mLogoImg.getOriginalFilename().equals("")) {
			carModel.setCar_logo_image(subDir1 + "/" + mLogoImg.getOriginalFilename());
		}
		if(!mCarImg1.getOriginalFilename().equals("")) {
			car.setCar_image1(subDir2 + "/" + mCarImg1.getOriginalFilename());
		}
		if(!mCarImg2.getOriginalFilename().equals("")) {
			car.setCar_image2(subDir2 + "/" + mCarImg2.getOriginalFilename());
		}
		if(!mCarImg3.getOriginalFilename().equals("")) {
			car.setCar_image3(subDir2 + "/" + mCarImg3.getOriginalFilename());
		}
		if(!mCarImg4.getOriginalFilename().equals("")) {
			car.setCar_image4(subDir2 + "/" + mCarImg4.getOriginalFilename());
		}
		if(!mCarImg5.getOriginalFilename().equals("")) {
			car.setCar_image5(subDir2 + "/" + mCarImg5.getOriginalFilename());
		}
		// =============================================================
		// 차량모델정보, 차량 정보 등록 작업 요청
		// 만약, 같은 모델의 차량이 등록되어 있으면 차량 정보만 등록 요청
		int selectCount = service.getSameModel(carModel);
		
		int insertCount1 = 0;
		if(selectCount == 0) {
			insertCount1 = service.registCarModel(carModel);
		}
		int insertCount2 = service.registCar(car);
		if(insertCount1 >= 0 && insertCount2 > 0) { // 성공
			try {
				if(selectCount == 0) {
					if(!mModelImg.getOriginalFilename().equals("")) {
						mModelImg.transferTo(new File(realPath1, mModelImg.getOriginalFilename()));
					}				
					if(!mLogoImg.getOriginalFilename().equals("")) {
						mLogoImg.transferTo(new File(realPath1, mLogoImg.getOriginalFilename()));
					}
				}
				
				
				if(!mCarImg1.getOriginalFilename().equals("")) {
					mCarImg1.transferTo(new File(realPath2, mCarImg1.getOriginalFilename()));
				}				
				if(!mCarImg2.getOriginalFilename().equals("")) {
					mCarImg2.transferTo(new File(realPath2, mCarImg2.getOriginalFilename()));
				}			
				if(!mCarImg3.getOriginalFilename().equals("")) {
					mCarImg3.transferTo(new File(realPath2, mCarImg3.getOriginalFilename()));
				}				
				if(!mCarImg4.getOriginalFilename().equals("")) {
					mCarImg4.transferTo(new File(realPath2, mCarImg4.getOriginalFilename()));
				}				
				if(!mCarImg5.getOriginalFilename().equals("")) {
					mCarImg5.transferTo(new File(realPath2, mCarImg5.getOriginalFilename()));
				}				
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			// 차량목록(CarListBoard) 서블릿 주소 리다이렉트
			return "redirect:CarListBoard";
		} else { // 실패
			// "차량 정보 등록 실패!" 메세지 출력 및 이전 페이지 돌아가기 처리
			model.addAttribute("msg", "차량 정보 등록 실패!");
			return "result/fail";
		}
		
		// =============================================================
		
//		return "";
	}
	// *******************************************************************
	//차량 목록 조회
	@GetMapping("CarListBoard")
	public String CarList(CarVO car, HttpSession session,
			@RequestParam(defaultValue = "") String searchType,
			@RequestParam(defaultValue = "") String searchKeyword,
			@RequestParam(defaultValue = "1") int pageNum, 
			Model model) {
//		System.out.println("carlist");
//		System.out.println("검색타입 : " + searchType);
//		System.out.println("검색어 : " + searchKeyword);
//		System.out.println("페이지번호 : " + pageNum);
		// --------------------------------------------------------------------
		// 페이징 처리를 위해 조회 목록 갯수 조절에 사용될 변수 선언
		int listLimit = 8; // 페이지 당 게시물 수
		int startRow = (pageNum - 1) * listLimit; // 조회할 게시물의 행 번호
		
		// 페이징 처리를 위한 계산 작업
		int listCount = service.getCarListCount(searchType, searchKeyword);
		int pageListLimit = 3; 
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
			model.addAttribute("targetURL", "CarListBoard?pageNum=1");
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
		System.out.println("최지민 + 진성민의 합작 : " + carList);
		
		return "car/car_manager_main";
	}
	//차량 상세 조회
	@GetMapping("CarDetailView")
	public String carModify(int car_idx, Model model) {
		CarVO car = service.getCarListDetail(car_idx);
		if(car == null) {
			model.addAttribute("msg", "존재하지 않는 차량입니다");
			return "result/fail";
		}
		List<String> fileList = new ArrayList<String>();
		fileList.add(car.getCar_image1());
		fileList.add(car.getCar_image2());
		fileList.add(car.getCar_image3());
		fileList.add(car.getCar_image4());
		fileList.add(car.getCar_image5());
		model.addAttribute("fileList", fileList);
		
		// Model 객체에 조회 결과 저장
		model.addAttribute("car", car);
		
		return"car/car_detailview";
	}
	
	//차량 리스트 정보 삭제
	@GetMapping("CarInfoDelete")
	public String carInfoDelete(int car_idx, @RequestParam(defaultValue = "1") int pageNum,
			HttpSession session, Model model) throws Exception {
		CarVO car = service.getCarListDetail(car_idx);
		int CardeleteCount = service.cardeleteBoard(car_idx);
		// 삭제 결과 판별하여 처리
		if(CardeleteCount > 0) {
			// --------------------------------------------------------------------
			// DB에서 게시물 정보 삭제 완료 시 실제 업로드 된 파일 삭제 처리 추가
			// 실제 업로드 경로 알아내기
			String realPath = session.getServletContext().getRealPath(uploadPath);
//			System.out.println("삭제할 파일명1 : " + board.getBoard_file1());
//			System.out.println("삭제할 파일명2 : " + board.getBoard_file2());
//			System.out.println("삭제할 파일명3 : " + board.getBoard_file3());
			// 파일 삭제에 사용될 파일명(최대 3개)를 List 또는 배열에 저장하여 처리 코드 중복 제거
			model.addAttribute("msg", "삭제 성공!");
			model.addAttribute("targetURL", "CarListBoard?pageNum=" + pageNum);
			return "result/closewindow";
		} else {
			model.addAttribute("msg", "삭제 실패!");
			return "result/fail";
		}
	}
	
	// 차량 상태 업데이트
	@PostMapping("carModify")
	public String carInfoUpdate(@RequestParam Map<String, String> map, HttpSession session, Model model) throws Exception {
		// 미 로그인 처리
		String id = (String)session.getAttribute("sId");
		if(id == null) {
			model.addAttribute("msg", "관리자 권한 필수!");
			model.addAttribute("targetURL", "MemberLogin");
			return "result/fail";
		}
//		String car_status = map.get("car_status");
//		int car_idx = Integer.parseInt(map.get("car_idx"));
//		
//		System.out.println("car_idx : " + car_idx);
		
		int updateCount = service.getCarInfoUpdate(map);
		if(updateCount > 0) {
			model.addAttribute("msg", "수정 완료!");
			return "result/closepage";
		}else {
			model.addAttribute("msg", "잘못된 접근입니다!");
			return "result/fail";
		}
	
		
		
		
	
	}
	
}
