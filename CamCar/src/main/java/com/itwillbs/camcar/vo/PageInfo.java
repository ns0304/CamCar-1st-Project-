package com.itwillbs.camcar.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor //파라미터 생성자 만들어줌
@NoArgsConstructor // 기본생성자 만들어줌
// 페이징 처리에 사용되는 정보를 저장할 PageInfo 클래스 정의(= DTO 역할)
public class PageInfo {
	private int listCount; // 총게시물 수
	private int pageListLimit; // 페이지 당 표시할 페이지 번호 갯수
	private int maxPage; // 전체 페이지 수
	private int startPage; // 시작 페이지 번호
	private int endPage; // 끝 페이지 번호
	
}
