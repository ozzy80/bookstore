package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.beanbook.model.Book;
import com.beanbook.service.BookManager;
import com.beanbook.service.PublisherManager;

@Controller
public class Hello {

	@Autowired
	private BookManager bookManager;

	@Autowired
	private PublisherManager publisherManager;

	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}

	@RequestMapping(value = "/books")
	public String getAllBooks(Model model) {
		List<Book> bookList = bookManager.getAllBooks();
		model.addAttribute("books", bookList);

		return "index2";
	}

	@RequestMapping(value = "/books/{isbn}")
	public String getBookByISBN(Model model, @PathVariable("isbn") Long isbn) {
		Book book = bookManager.getBookByISBN(isbn);
		model.addAttribute("book", book);

		return "index3";
	}

	@RequestMapping(value = "/books/add")
	public String addBook(Model model) {
		model.addAttribute("book", new Book());
		return "add";
	}

	@RequestMapping(value = "/books/add/new", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book book) {
		book.setPublisher(publisherManager.getPublisherByID(1));
		bookManager.addBook(book);
		return "redirect:/books";
	}

	@RequestMapping(value = "/books/del/{isbn}")
	public String addBook(@PathVariable("isbn") Long isbn) {
		bookManager.deleteBook(isbn);
		;
		return "redirect:/books";
	}

}
