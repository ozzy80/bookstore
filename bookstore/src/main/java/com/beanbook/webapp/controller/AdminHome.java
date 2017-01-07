package com.beanbook.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminHome {

	@RequestMapping
	public String home() {
		return "admin_home";
	}

	@RequestMapping("/customer")
	public String customerManager() {

		return "customer_manager";
	}
}
