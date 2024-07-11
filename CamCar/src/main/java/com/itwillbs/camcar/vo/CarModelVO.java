package com.itwillbs.camcar.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/*
-- 차량모델정보
create table car_model_info(
	car_model varchar(20) primary key,			-- 모델명
	car_company varchar(10) not null unique,	-- 제조사
	car_type varchar(10) not null,				-- 차종
	car_model_image varchar(400) not null,		-- 차량모델사진
	car_logo_image varchar(400)					-- 제조사로고사진
); 
 */
@Data
public class CarModelVO {
	// 1. 멤버변수 선언
	// ------------ 생성자 정의 생략(기본 생성자 활용) -------------
	// 2. Getter/Setter 정의
	// 3. toString() 메서드 오버라이딩
	// -------------------------------------------------------------
	private String car_model;
	private String car_company;
	private String car_type;
	
	// --------------------------------------------------------------------------------
	// 파일 업로드 시 실제 파일과 파일명을 별도로 분리하여 관리
	// 1) String 타입으로 지정할 변수는 실제 파일이 아닌 파일명을 다룰 용도로 사용
	//    => 멤버변수명은 form 태그에서 지정한 파일 업로드 요소의 name 속성과 다르게,
	//       DB 의 파일명 저장하는 컬럼명과 같게 지정
	private String car_model_image;
	private String car_logo_image;
	// --------------------------------------------------------------------------------
	// 2) MultipartFile 타입으로 지정할 변수는 업로드되는 실제 파일을 다룰 용도로 사용
	//    => 멤버변수명은 form 태그에서 지정한 파일 업로드 요소의 name 속성과 같게 지정
	private MultipartFile model_image;
	private MultipartFile logo_image;
	// --------------------------------------------------------------------------------
}
