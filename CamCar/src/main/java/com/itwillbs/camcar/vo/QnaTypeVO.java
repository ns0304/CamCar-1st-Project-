package com.itwillbs.camcar.vo;

import lombok.Data;

/*
create table qna_type(
	qna_type_idx int primary key auto_increment,
    qna_type_name varchar(50) not null unique
);
 */
@Data
public class QnaTypeVO {
	private int qna_type_idx;
	private String qna_type_name;
}
