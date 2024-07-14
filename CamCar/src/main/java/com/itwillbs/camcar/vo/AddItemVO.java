package com.itwillbs.camcar.vo;

import lombok.Data;

@Data
public class AddItemVO {

	private String item_code;
	private int brc_idx;
	private int item_inventory;
	private int rental_cost;
	private String item_info;
	
}
