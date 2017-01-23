package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.beanbook.model.TopBook;
import com.beanbook.service.TopBookManager;

@Controller
public class TopBookController {

	@Autowired
	private TopBookManager topBookManager;

	@RequestMapping(value = "/topbooks", method = RequestMethod.GET)
	private @ResponseBody List<TopBook> getActiveTopBooks() {
		return topBookManager.getAllActiveTopBooks();
	}

}
