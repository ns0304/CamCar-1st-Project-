package com.itwillbs.camcar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.itwillbs.camcar.vo.BoardVO;

@Controller
public class Board_Notice_ManagerController {

	@GetMapping("board_notice")
	public String member(BoardVO board ) {
		return"board/board_notice";
	}
}
