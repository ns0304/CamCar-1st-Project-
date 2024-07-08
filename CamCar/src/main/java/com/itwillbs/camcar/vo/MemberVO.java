package com.itwillbs.camcar.vo;

import java.sql.Date;

import lombok.Data;

/*
-------------------------------------------------------------
-- 회원 정보
create table member_info (
	mem_idx int primary key auto_increment, -- 회원 번호 
	mem_id varchar(15) not null unique,		-- 회원 아이디
	mem_passwd varchar(20) not null,		-- 회원 비밀번호
	mem_name  varchar(30) not null,			-- 회원 이름
	mem_tel varchar(20) not null unique,	-- 휴대 번호
	mem_post_code varchar(10),				-- 도로명주소
	mem_add1 varchar(100),					-- 기본주소
	mem_add2 varchar(100),					-- 상세주소 
	mem_accept_sms int not null,			-- SMS 수신여부 
	mem_birthday date not null,				-- 생년월일 
	mem_sign_date datetime default now()	-- 회원가입일
);
	alter table member_info
	add mem_jumin varchar(15) not null unique after mem_tel;	-- 휴대번호 컬럼 뒤에 '주민번호'컬럼 추가
	alter table member_info
	add mem_email varchar(30) unique after mem_jumin;			-- 주민번호 컬럼 뒤에 '이메일'컬럼 추가
	alter table member_info
	add mem_withdraw_date datetime;	-- '회원 탈퇴일'컬럼 추가
	alter table member_info
	add mem_status INT not null ;	-- '회원 상태'컬럼 추가(1 : 정상, 2 : 휴면, 3 : 탈퇴)
	alter table member_info
	add mem_mail_auth_status char(1) not null check(mem_mail_auth_status in('Y', 'N'));

	-- 회원 비밀번호 컬럼 사이즈 수정
	-- (varchar(20), not null) -> (varchar(100), not null)
	alter table member_info
	modify mem_passwd varchar(100) not null;
--------------------------------------------------------------


*/
@Data
public class MemberVO {
	// 1. 멤버변수 선언
	// ---- 생성자 정의 생략(기본 생성자 활용) ----
	// 2. Getter/Setter 정의
	// 3. toString() 메서드 오버라이딩
	// ----------------------------------------------
	private int mem_idx;
	private String mem_id;
	private String mem_passwd;
	private String mem_email;
	private String mem_email1;
	private String mem_email2;
	private String mem_post_code;
	private String mem_add1;
	private String mem_add2;
	private String mem_name;
	private String mem_jumin;
	private String mem_tel;
	private int mem_accept_sms;
	private String mem_birthday;
	private Date mem_sign_date;
	private Date mem_withdraw_date;
	private int mem_status;
	private String mem_mail_auth_status;
	
}



