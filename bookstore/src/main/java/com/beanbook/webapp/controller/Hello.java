package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beanbook.dao.BookDao;
import com.beanbook.model.Book;
import com.beanbook.service.BookManager;

@Controller
public class Hello {

	@Autowired
	private BookManager bookDao;

	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}

	@RequestMapping(value = "/books")
	public String getAllBooks(Model model) {
		List<Book> bookList = bookDao.getAllBooks();
		model.addAttribute("books", bookList);

		return "index2";
	}

	@RequestMapping(value = "/books/{isbn}")
	public String getBookByISBN(Model model, @PathVariable("isbn") Long isbn) {
		Book book = bookDao.getBookByISBN(isbn);
		model.addAttribute("book", book);

		return "index3";
	}

}
