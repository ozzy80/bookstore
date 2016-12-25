package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beanbook.dao.BookDao;
import com.beanbook.model.Book;

@Controller
public class Hello {

	@Autowired
	private BookDao bookDao;
	
	@RequestMapping(value="/")
	public String home(){
		return "index";
	}
	
	@RequestMapping(value="/books")
	public String bookmodel(Model model){
		List<Book> bookList = bookDao.getAllBooks();
		model.addAttribute("books", bookList);
		
		return "index2";
	}
}
