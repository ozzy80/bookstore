package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beanbook.model.Author;
import com.beanbook.model.Book;
import com.beanbook.service.BookManager;
import com.beanbook.service.PublisherManager;
import com.beanbook.service.AuthorManager;

@Controller
public class Hello {

	@Autowired
	private BookManager bookManager;

	@Autowired
	private PublisherManager publisherManager;
	
	@Autowired
	private AuthorManager authorManager;

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
		return "add_book";
	}

	@RequestMapping(value = "/books/add/new", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book book) {
		book.setPublisher(publisherManager.getPublisherByID(1));
		bookManager.addBook(book);
		return "redirect:/books";
	}
	
	@RequestMapping(value="/authors/add")
	public String addAuthor(Model model)
	{
		model.addAttribute("author",new Author());
		return "add_author";
	}
	
	@RequestMapping(value = "/authors/add/new" , method=RequestMethod.POST)
	public String addAuthor(@ModelAttribute("author") Author author)
	{
		authorManager.addAuthor(author);
		return "redirect:/authors/1";
	}

	@RequestMapping(value = "/books/del/{isbn}")
	public String deleteBook(@PathVariable("isbn") Long isbn) {
		bookManager.deleteBook(isbn);
		;
		return "redirect:/books";
	}

	@RequestMapping(value = "/authors/del/{idAutora}")
	public String deleteAuthor(@PathVariable("idAutora") Integer id_autora)
	{
		authorManager.deleteAuthor(id_autora);
		return "redirect:/books";
	}
	
	@RequestMapping(value = "/authors/{idAutora}")
	public String getAuthorByID(Model model, @PathVariable("idAutora") Integer id_autora)
	{
		Author author = authorManager.getAuthorByID(id_autora);
		model.addAttribute("author",author);
		return "index4";
		
	}
	
}
