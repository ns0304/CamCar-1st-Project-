package com.itwillbs.camcar.vo;

import java.sql.Date;

import lombok.Data;

/*
-- 운전자 정보
create table drivers_info(
	dri_idx int primary key auto_increment,	-- 운전자 번호
	dri_name varchar(30) not null,			-- 운전자 이름
	dri_tel varchar(20) not null unique,	-- 운전자 전화번호
	dri_birthday date not null,				-- 운전자 생년월일
	lic_num varchar(12) not null unique,	-- 면허증 번호
	lic_info varchar(5) not null unique,	-- 면허증 정보
	lic_issue_date date not null,			-- 면허증 발급일자
	lic_expiration_date date not null		-- 면허증 만기일자
);
*/

@Data
public class DriverVO {
	
	private int dri_idx;
	private String dri_name;
	private String dri_tel;
	private String dri_birthday;
	private String lic_info;
	private String lic_num;
	private String lic_issue_date;
	private String lic_expiration_date;
}
