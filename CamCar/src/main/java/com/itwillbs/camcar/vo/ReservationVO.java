package com.itwillbs.camcar.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.time.LocalDateTime;

import lombok.Data;

/*
-- 예약정보
create table res_info(
	res_idx int primary key auto_increment,	-- 예약 고유 번호
	res_time datetime not null,				-- 예약 일시
	res_rental_date datetime not null,		-- 대여 일시
	res_return_date datetime not null,		-- 반납 일시
	res_rent_time int not null,				-- 총 대여시간
	brc_rent_name varchar(20) not null,		-- 대여 장소
	car_idx int not null,					-- 차량코드
	car_insurance varchar(300) not null 
	check(car_insurance in('선택안함', '캠핑카 단기보험')),	-- 자동차보험
	lic_num varchar(12) not null,			-- 면허증 번호
	mem_idx int not null, 					-- 회원번호
	
    foreign key(brc_rent_name) references brc_info(brc_name),	-- 지점정보(지점이름) 참조
    foreign key(car_idx) references car_info(car_idx),			-- 차량정보(차량지점코드) 참조
    foreign key(lic_num) references drivers_info(lic_num),		-- 운전자정보(면허증번호) 참조
    foreign key(mem_idx) references member_info(mem_idx)		-- 회원정보(회원번호) 참조
);
 */	
@Data
public class ReservationVO {
	// 1. 멤버변수 선언
	// ------------ 생성자 정의 생략(기본 생성자 활용) -------------
	// 2. Getter/Setter 정의
	// 3. toString() 메서드 오버라이딩
	// -------------------------------------------------------------
	private int res_idx;
	private Timestamp res_time;
//	private Date res_rental_date;
//	private Date res_return_date;
	private Timestamp res_rental_date;
	private Timestamp res_return_date;
	private String brc_rent_name;
	private int car_idx;
	private String car_insurance;
	private String lic_num;
	private int mem_idx;
	private int res_fee;

}
