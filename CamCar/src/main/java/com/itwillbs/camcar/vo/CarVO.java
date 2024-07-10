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
	private String car_number;
	private String car_model;
	private int car_old;
	private int brc_idx;
	private String car_status;
	private String board_file1;
	private String board_file2;
	private String board_file3;
	private String board_file4;
	private String board_file5;
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;
	
}
