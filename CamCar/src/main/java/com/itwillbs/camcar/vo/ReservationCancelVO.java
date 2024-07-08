package com.itwillbs.camcar.vo;

import java.sql.Timestamp;

import lombok.Data;

/*
-- 예약취소테이블
create table res_cancel(
	cancel_idx int primary key auto_increment,	-- 예약취소고유번호
	pay_idx int not null unique,				-- 결제고유번호
	res_idx int not null unique,				-- 예약고유번호
	cancel_date datetime default now(),			-- 예약취소일시
	cancel_pay int not null,					-- 취소금액
    foreign key(pay_idx) references pay_info(pay_idx),	-- 결제정보(결제고유번호) 참조
    foreign key(res_idx) references res_info(res_idx)	-- 예약정보(예약고유번호) 참조
);
*/

@Data
public class ReservationCancelVO {

	// 1. 멤버변수 선언
	// ------------ 생성자 정의 생략(기본 생성자 활용) -------------
	// 2. Getter/Setter 정의
	// 3. toString() 메서드 오버라이딩
	// -------------------------------------------------------------
	private int cancel_idx;
	private int pay_idx;
	private int res_idx;
	private Timestamp cancel_date;
	private int cancel_pay;
}
