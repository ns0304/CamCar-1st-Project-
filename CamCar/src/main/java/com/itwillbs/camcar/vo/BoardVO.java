package com.itwillbs.camcar.vo;

import java.sql.Timestamp;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

/*
[ mvc_board5.board 테이블 정의 ]
글번호(board_num) - 정수, PK
작성자(board_name) - 문자열(16), NN
제목(board_subject) - 문자열(100), NN
내용(board_content) - 문자열(2000), NN
참조글번호(board_re_ref) - 정수, NN
들여쓰기레벨(board_re_lev) - 정수, NN
순서번호(board_re_seq) - 정수, NN
조회수(board_readcount) - 정수, NN
작성일시(board_date) - 날짜 및 시각(DATETIME), NN
작성자 IP주소(board_writer_ip) - 문자열(20), NN
--------------------------------------------------
*/
@Data
public class BoardVO {
	
// --------------------------------------------------------------------------------
	// 파일 업로드 시 실제 파일과 파일명을 별도로 분리하여 관리
	// 1) String 타입으로 지정할 변수는 실제 파일이 아닌 파일명을 다룰 용도로 사용
	//    => 멤버변수명은 form 태그에서 지정한 파일 업로드 요소의 name 속성과 다르게,
	//       DB 의 파일명 저장하는 컬럼명과 같게 지정
	private String board_file1;
	private String board_file2;
	private String board_file3;
	private String board_file4;
	private String board_file5;
	
	private int board_num;
	private String board_name;
	private String board_subject;
	private String board_content;
	private int board_re_ref;
	private int board_re_lev;
	private int board_re_seq;
	private int board_readcount;
	private Timestamp board_date;
	private String board_writer_ip;
	
	private MultipartFile file1;
	private MultipartFile file2;
	private MultipartFile file3;
	private MultipartFile file4;
	private MultipartFile file5;
	
}














