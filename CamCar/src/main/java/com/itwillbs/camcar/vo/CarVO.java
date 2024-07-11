package com.itwillbs.camcar.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/*
-- (개별)차량정보
create table car_info(
	car_idx int primary key,				-- 차량코드
	car_number varchar(10) not null unique,	-- 차량번호
	car_model varchar(20) not null,			-- 모델명
	car_old int,							-- 연식
	brc_idx int not null unique,			-- 차량 지점 코드 			
	car_status varchar(400),				-- 차량상태
    foreign key(brc_idx) references brc_info(brc_idx)
);
 */

@Data
public class CarVO {
	// 1. 멤버변수 선언
	// ------------ 생성자 정의 생략(기본 생성자 활용) -------------
	// 2. Getter/Setter 정의
	// 3. toString() 메서드 오버라이딩
	// -------------------------------------------------------------
	private int car_idx;
	private int brc_idx;
	private String car_model;
	private String car_number;
	private String car_company;
	private int car_riding;
	private String car_fuel_type;
	private int car_age;
	private int car_career;
	private int car_old;
	private char pet_opt;
	private String car_license;
	private int car_weekdays;
	private int car_weekend;
	
	// --------------------------------------------------------------------------------
	// 파일 업로드 시 실제 파일과 파일명을 별도로 분리하여 관리
	// 1) String 타입으로 지정할 변수는 실제 파일이 아닌 파일명을 다룰 용도로 사용
	//    => 멤버변수명은 form 태그에서 지정한 파일 업로드 요소의 name 속성과 다르게,
	//       DB 의 파일명 저장하는 컬럼명과 같게 지정
	private String car_image1;
	private String car_image2;
	private String car_image3;
	private String car_image4;
	private String car_image5;
	// --------------------------------------------------------------------------------
	// 2) MultipartFile 타입으로 지정할 변수는 업로드되는 실제 파일을 다룰 용도로 사용
	//    => 멤버변수명은 form 태그에서 지정한 파일 업로드 요소의 name 속성과 같게 지정
	private MultipartFile image1;
	private MultipartFile image2;
	private MultipartFile image3;
	private MultipartFile image4;
	private MultipartFile image5;
	// --------------------------------------------------------------------------------
		
	private String car_status;
	
}
