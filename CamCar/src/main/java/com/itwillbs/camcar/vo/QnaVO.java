package com.itwillbs.camcar.vo;

import java.sql.Timestamp;

import lombok.Data;

/*
 create table qna(
	qna_number int primary key,			            -- 1:1 문의글 번호
    qna_type_idx int not null,							-- 1:1문의유형코드
	qna_inquery varchar(50) not null,					-- 1:1 문의 제목
	qna_content varchar(4000) not null,					-- 1:1 문의 내용
	qna_re_ref int not null,                            -- 참조글번호
	qna_re_lev int not null,                            -- 들여쓰기레벨
	qna_re_seq int not null,                            -- 순서번호
	qna_date datetime not null,                         -- 작성날짜
	mem_id varchar(15) not null,						-- 작성자 아이디
    foreign key(qna_type_idx) references qna_type(qna_type_idx),	-- 1:1문의유형(1:1문의유형코드) 참조
    foreign key(mem_id) references member_info(mem_id)				-- 회원정보(회원아이디) 참조
 );
 */
@Data
public class QnaVO {
	private int qna_number;
	private int qna_type_idx;
	private String qna_inquery;
	private String qna_content;
	private int qna_re_ref;
	private int qna_re_lev;
	private int qna_re_seq;
	private Timestamp qna_date;
	private String mem_id;
	
}
