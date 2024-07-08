package com.itwillbs.camcar.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class Car_ManageController {

	@GetMapping("car_management")
	public String car() {
		return "car/car_manager_main";
	}
	
	@GetMapping("new_car_management")
	public String new_car() {
		return "car/new_car_manager_main";
	}
}
