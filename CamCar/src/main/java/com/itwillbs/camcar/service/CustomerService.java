package com.itwillbs.camcar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.itwillbs.camcar.mapper.CustomerMapper;
import com.itwillbs.camcar.vo.BoardVO;
import com.itwillbs.camcar.vo.QnaVO;

@Service
public class CustomerService {
	@Autowired
	private CustomerMapper mapper;
	
	// 1:1 문의 작성
	public int registInquiry(QnaVO qna) {
		return mapper.insertInquiry(qna);
	}
	
	// 공지사항 게시글 갯수 조회
	public int getBoardListCount(String searchType, String searchKeyword) {
		return mapper.selectBoardListCount(searchType, searchKeyword);
	}
	
	// 공지사항 게시글 목록 조회
	public List<BoardVO> getBoardList(String searchType, String searchKeyword, int startRow, int listLimit) {
		return mapper.selectBoardList(searchType, searchKeyword, startRow, listLimit);
	}
	
	// 공지사항 상세보기
	public BoardVO getBoard(int bo_idx, boolean isIncreaseReadcount) {
		
		BoardVO bo =  mapper.selectBoardDetail(bo_idx);
		
		// 조회 성공 & 조회수 증가를 수행해야할 경우 
		// BoardMapper - updateReadcount() 메서드 호출하여 해당 게시물의 조회수 증가
		if(bo != null && isIncreaseReadcount) {
			// 단, 조회수 증가된 게시물 번호를 전달받기 위해 글번호가 저장된 BoardVO 객체 전달
			mapper.updateReadcount(bo);
			// => Mapper 에서 조회수 증가 작업 후 BoardVO 객체에 증가된 조회수 값 저장했을 경우
			//    별도의 리턴 과정이 없어도 동일한 주소값을 갖는 BoardVO 객체를 공유하므로
			//    변경된 조회수 값의 영향을 동일하게 받는다!
			// => 즉, 동일한 객체를 공유하기 때문에 사용하는 값도 동일함(= 변경된 값도 동일)
		}
		
		return bo;
	}

}
