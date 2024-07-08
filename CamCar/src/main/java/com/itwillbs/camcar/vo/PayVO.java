package com.itwillbs.camcar.vo;

import java.sql.Timestamp;

import lombok.Data;

/*
-- 결제정보
create table pay_info(
	pay_idx int primary key,					-- 결제 고유번호
	res_idx int not null unique,				-- 예약 고유번호 
	pay_method_idx int not null,				-- 결제방법코드 
	pay_total int not null,						-- 최종 결제금액
	pay_status varchar(30) not null,			-- 결제상태
	pay_time datetime not null default now()	-- 결제일시
);
*/

@Data
public class PayVO {

	// 1. 멤버변수 선언
	// ------------ 생성자 정의 생략(기본 생성자 활용) -------------
	// 2. Getter/Setter 정의
	// 3. toString() 메서드 오버라이딩
	// -------------------------------------------------------------
	private int pay_idx;
	private int res_idx;
	private int pay_method_idx;
	private int pay_total;
	private String pay_status;
	private Timestamp pay_time;
}
