package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beanbook.dao.hibernate.BookDaoHibernate;
import com.beanbook.model.Book;

@Controller
public class Hello {

	@RequestMapping(value="/")
	public String home(){
		return "index";
	}
	
	private BookDaoHibernate bookDao = new BookDaoHibernate();
	
	@RequestMapping(value="/books")
	public String bookmodel(Model model){
		List<Book> bookList = bookDao.getAllBooks();
		model.addAttribute("books", bookList);
		
		return "index2";
	}
}
