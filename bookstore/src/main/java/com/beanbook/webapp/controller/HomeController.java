package com.beanbook.webapp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {

	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}

	@RequestMapping(value = "/pomoc")
	public String pomoc()
	{
		return "pomoc";
	}
	
	@RequestMapping(value ="/o_nama")
	public String onama()
	{
		return "o_nama";
	}
}
