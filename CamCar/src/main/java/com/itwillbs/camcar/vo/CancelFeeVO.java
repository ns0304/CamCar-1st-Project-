package com.itwillbs.camcar.vo;

import lombok.Data;

/*
-- 예약취소수수료
create table res_cancel_fee(
	cancel_fee_idx int primary key auto_increment,	-- 취소수수료고유번호
	res_idx int not null unique,					-- 예약고유번호
	res_rental_date datetime not null,				-- 대여일시
	cancel_date datetime not null,					-- 예약취소일시
	cancel_fee decimal not null,					-- 예약취소수수료
    -- ex.대여일시 - 예약취소일시 뷰테이블 생성해야함
    foreign key(res_idx) references res_cancel(res_idx) 	-- 예약취소테이블(예약고유번호) 참조
);
*/

@Data
public class CancelFeeVO {

	// 1. 멤버변수 선언
	// ------------ 생성자 정의 생략(기본 생성자 활용) -------------
	// 2. Getter/Setter 정의
	// 3. toString() 메서드 오버라이딩
	// -------------------------------------------------------------
	private int cancel_fee_idx;
	private int res_idx;
	private double cancel_fee;
	// ******* DB의 데이터타입 decimal을 VO에서는 뭐라 써야할 지 모르겠음 *******
}
