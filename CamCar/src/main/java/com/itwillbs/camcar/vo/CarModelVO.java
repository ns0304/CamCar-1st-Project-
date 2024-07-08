package com.itwillbs.camcar.vo;

import lombok.Data;

/*
-- 차량모델정보
create table car_model_info(
	car_model varchar(20) primary key,			-- 모델명
	car_type varchar(10) not null,				-- 차종 
	car_company varchar(10) not null unique,	-- 제조사
	car_shift_type varchar(10) not null,		-- 변속타입
	car_fuel_type  varchar(10) not null,		-- 연료
	car_riding int,								-- 정원
	car_age int,								-- 나이제한
	car_career int,								-- 운전경력제한
	car_license varchar(10) not null,			-- 면허종류
	car_weekdays int not null,					-- 주중 대여료
	car_weekend int not null,					-- 주말 대여료
	car_image_id int not null,					-- 차량 사진 아이디
    foreign key(car_image_id) references car_images(car_image_id)	-- 차량사진(차량사진아이디) 참조
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
	private String car_type;
	private String car_company;
	private String car_shift_type;
	private String car_fuel_type;
	private int car_riding;
	private int car_age;
	private int car_career;
	private String car_license;
	private int car_weekdays;
	private int car_weekend;
	private int car_image_id;
}
