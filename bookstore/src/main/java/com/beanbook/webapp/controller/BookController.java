package com.beanbook.webapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.beanbook.model.Book;
import com.beanbook.service.BookManager;
import com.beanbook.service.LetterManager;
import com.beanbook.service.PublisherManager;

@Controller
public class BookController {

	@Autowired
	FileUploadController file;

	@Autowired
	private BookManager bookManager;

	@Autowired
	private PublisherManager publisherManager;

	@Autowired
	private LetterManager letterManager;

	@RequestMapping(value = "admin/books")
	public @ResponseBody List<Book> getAllBooks() {
		return bookManager.getAllBooks();
	}

	@RequestMapping(value = "/booklist")
	public String getBooksGenre() {
		return "books";
	}

	@RequestMapping(value = "/books/{isbn}")
	public String getBookByISBN(Model model, @PathVariable("isbn") Long isbn) {
		Book book = bookManager.getBookByISBN(isbn);
		model.addAttribute("book", book);
		if(book.getDiscount() != null && book.getDiscount() > 0) {
			Double number = book.getPrice() - book.getPrice() / 100 * book.getDiscount();
		    model.addAttribute("izracunataVrednostSaPopustom", number);
				
			}
		
		
		return "book_description";
	}

	@RequestMapping(value = "/books/add")
	public String addBook(Model model) {
		model.addAttribute("book", new Book());
		return "add_book";
	}

	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = "admin/book/upload")
	public void uploadPicture(@RequestParam("file") MultipartFile imgFile, @RequestParam("imageName") String imageName,
			@RequestParam("publisherName") String publisher) {

		String realPathToUpload = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\" + publisher;
		file.uploadPicture(imgFile, imageName, realPathToUpload);
	}
	
	
	@RequestMapping(value = "/books/add", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book book, HttpServletRequest request) {
		book.setPublisher(publisherManager.getPublisherByID(1));
		book.setLetter(letterManager.getLetterByID(1));
		bookManager.saveBook(book);

		String realPathToUpload = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\"
				+ book.getPublisher().getName();
		String imageName = book.getTitle() + "-" + book.getIsbn() + ".jpg";
		file.uploadPicture(book.getBookImage(), imageName, realPathToUpload);

		return "redirect:/books";
	}

	@RequestMapping(value = "/books/update/{isbn}")
	public String updateBook(Model model, @PathVariable("isbn") Long isbn) {
		Book book = bookManager.getBookByISBN(isbn);
		model.addAttribute("book", book);

		return "update_book";
	}

	@RequestMapping(value = "/books/update", method = RequestMethod.POST)
	public String updateBook(@ModelAttribute("book") Book book, @RequestParam("oldIsbn") Long oldIsbn) {

		book.setPublisher(publisherManager.getPublisherByID(1));
		book.setLetter(letterManager.getLetterByID(1));

		if (book.getBookImage() != null && !book.getBookImage().isEmpty()) {
			Book oldBook = bookManager.getBookByISBN(oldIsbn);
			file.deletePicture(oldBook.getTitle() + "-" + oldBook.getIsbn() + ".jpg",
					"C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\"
							+ oldBook.getPublisher().getName());
		}
		bookManager.saveBook(book);

		file.uploadPicture(book.getBookImage(), book.getTitle() + "-" + book.getIsbn() + ".jpg",
				"C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\"
						+ book.getPublisher().getName());

		return "redirect:/books";
	}

	@RequestMapping(value = "/books/del/{isbn}")
	public String deleteBook(@PathVariable("isbn") Long isbn) {
		Book book = bookManager.getBookByISBN(isbn);
		bookManager.deleteBook(isbn);

		String realPathToUpload = "C:\\dev\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\"
				+ book.getPublisher().getName();
		String imageName = book.getTitle() + "-" + book.getIsbn() + ".jpg";
		file.deletePicture(imageName, realPathToUpload);

		return "redirect:/books";
	}

	@RequestMapping(value = "/books/new", method = RequestMethod.GET)
	public @ResponseBody List<Book> getBooks(
			@RequestParam(value = "sort", required = false, defaultValue = "desc") String sort,
			@RequestParam(value = "start", required = false, defaultValue = "0") int start,
			@RequestParam(value = "limit", required = false, defaultValue = "14") int limit) {

		return bookManager.getBooks(sort, start, limit);
	}

	@RequestMapping(value = "/books/autocomplete", method = RequestMethod.GET)
	public @ResponseBody List<Book> autocomplete(@RequestParam(value = "q") String query) {

		return bookManager.autocomplete(query);
	}

	@RequestMapping(value = "/books/genre", method = RequestMethod.GET)
	public @ResponseBody List<Book> getBooksByGenre(@RequestParam(value = "genre") String genre,
			@RequestParam(value = "start", required = false, defaultValue = "0") int start,
			@RequestParam(value = "limit", required = false, defaultValue = "14") int limit,
			@RequestParam(value = "sortBy", required = false, defaultValue = "14") String sortBy) {

		if (start < 0 || limit < 0) {
			return null;
		}
		if (sortBy.isEmpty()) {
			sortBy = "title desc";
		}
		return bookManager.getBooksByGenre(genre, start, limit, sortBy);
	}

	@RequestMapping(value = "admin/books/booknumber", method = RequestMethod.GET)
	public @ResponseBody Map<String, Long> getAviableBookNumber() {
		Map<String, Long> number = new HashMap<>();
		number.put("number", bookManager.getAviableBookNumber());
		return number;
	}
}
