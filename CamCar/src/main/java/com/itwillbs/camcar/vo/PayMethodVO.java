package com.itwillbs.camcar.vo;

import lombok.Data;

/*
-- 결제방법
create table pay_method(
	pay_method_idx int primary key auto_increment,	-- 결제방법코드
    pay_method_name varchar(20) not null unique		-- 결제방법명
);
*/

@Data
public class PayMethodVO {

	// 1. 멤버변수 선언
	// ------------ 생성자 정의 생략(기본 생성자 활용) -------------
	// 2. Getter/Setter 정의
	// 3. toString() 메서드 오버라이딩
	// -------------------------------------------------------------
	private int pay_method_idx;
	private String pay_method_name;
}
