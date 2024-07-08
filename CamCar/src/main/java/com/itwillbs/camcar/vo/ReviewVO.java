package com.itwillbs.camcar.vo;

import lombok.Data;

/*
-- 차량리뷰
create table rev_car(
	rev_idx int primary key auto_increment,
	rev_res_idx int,
	car_review1 int,
	car_review2 int,
	car_review3 int,
	car_review4 int,
	car_review5 int,
    foreign key(rev_res_idx) references res_info(res_idx)	-- 예약정보(예약고유번호) 참조
);
*/

@Data
public class ReviewVO {

	// 1. 멤버변수 선언
	// ------------ 생성자 정의 생략(기본 생성자 활용) -------------
	// 2. Getter/Setter 정의
	// 3. toString() 메서드 오버라이딩
	// -------------------------------------------------------------
	private int rev_idx;
	private int rev_res_idx;
	private int car_review1;
	private int car_review2;
	private int car_review3;
	private int car_review4;
	private int car_review5;
}
