package com.beanbook.webapp.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import com.beanbook.model.Book;
import com.beanbook.service.BookManager;
import com.beanbook.service.LetterManager;
import com.beanbook.service.PublisherManager;

@Controller
public class BookController {

	private Path path_book;
	
	@Autowired
	private BookManager bookManager;

	@Autowired
	private PublisherManager publisherManager;
		
	@Autowired 
	private LetterManager letterManager;

	
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

	@RequestMapping(value="/books/update/{isbn}")
	public String updateBook(Model model, @PathVariable("isbn") Long isbn){
		Book book = bookManager.getBookByISBN(isbn);
		model.addAttribute("book", book);
		
		return "update_book";
	}

	@RequestMapping(value = "/books/update/new")
	public String updateBook(@ModelAttribute("book") Book book)
	{
		
		book.setPublisher(publisherManager.getPublisherByID(1));
		book.setLetter(letterManager.getLetterByID(1));
		bookManager.updateBook(book);
		return "redirect:/books";
	}
	
	@RequestMapping(value = "/books/add")
	public String addBook(Model model) {
		model.addAttribute("book", new Book());
		return "add_book";
	}

	@RequestMapping(value = "/books/add/new", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book book, HttpServletRequest request) {
		book.setPublisher(publisherManager.getPublisherByID(1));
		book.setLetter(letterManager.getLetterByID(1));
		//aha a u pogledu polja za pismo nema prilikom dodavanja
		//nove knjige 
		bookManager.addBook(book);
		MultipartFile bookImage = book.getBookImage();
		// String rootDirectory =
		// request.getSession().getServletContext().getRealPath("/");
		// * TODO Dodaj dinamicki
		// */
		String realPathtoUploads = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\"
				+ book.getPublisher().getName();
		path_book = Paths.get(realPathtoUploads + "\\" + book.getTitle() + "-" + book.getIsbn() + ".jpg");

		if (!new File(realPathtoUploads).exists()) {
			new File(realPathtoUploads).mkdir();
		}

		if (bookImage != null && !bookImage.isEmpty()) {
			try {
				System.out.println("usaoooo");
				bookImage.transferTo(new File(path_book.toString()));
			} catch (IllegalStateException | IOException e) {
				throw new RuntimeException("Book image saving failed", e);
			}
		}
		return "redirect:/books";
	}
	

	@RequestMapping(value = "/books/del/{isbn}")
	public String deleteBook(@PathVariable("isbn") Long isbn) {
		Book book = bookManager.getBookByISBN(isbn);
		bookManager.deleteBook(isbn);

		String realPathtoUploads = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\"
				+ book.getPublisher().getName();
		path_book = Paths.get(realPathtoUploads + "\\" + book.getTitle() + "-" + book.getIsbn() + ".jpg");

		if (Files.exists(path_book)) {
			try {
				Files.delete(path_book);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		return "redirect:/books";
	}
	
	
	
}
