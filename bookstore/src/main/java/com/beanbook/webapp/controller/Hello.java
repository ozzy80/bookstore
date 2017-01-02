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


import com.beanbook.model.Author;
import com.beanbook.model.Book;
import com.beanbook.service.BookManager;
import com.beanbook.service.PublisherManager;
import com.beanbook.service.AuthorManager;

@Controller
public class Hello {

	private Path path_book;

	private Path path_author;
	
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
	
	@RequestMapping(value="/authors/add")
	public String addAuthor(Model model)
	{
		model.addAttribute("author",new Author());
		return "add_author";
	}

	@RequestMapping(value = "/books/add/new", method = RequestMethod.POST)
	public String addBook(@ModelAttribute("book") Book book, HttpServletRequest request) {
		book.setPublisher(publisherManager.getPublisherByID(1));
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
	@RequestMapping(value = "/authors/add/new" , method=RequestMethod.POST)
	public String addAuthor(@ModelAttribute("author") Author author,HttpServletRequest request)
	{
		authorManager.addAuthor(author);
		MultipartFile authorImage = author.getAuthorImage();
		String realPathToUpload = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\authors";
		path_author = Paths.get(realPathToUpload + "\\" + author.getFirstName() + "_" + author.getLastName() + "_"+ author.getAuthorId() + ".jpg");
		if(!new File(realPathToUpload).exists())
		{
			new File(realPathToUpload).mkdir();
		}
		
		if(authorImage != null && !authorImage.isEmpty())
		{
			try
			{
				System.out.println("usao");
				authorImage.transferTo(new File(path_author.toString()));
			}
			catch(IllegalStateException | IOException e) {
				throw new RuntimeException("Author image saving failed",e);
			}
		}
			
		return "redirect:/authors/1";
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

	@RequestMapping(value = "/authors/del/{idAutora}")
	public String deleteAuthor(@PathVariable("idAutora") Integer id_autora)
	{
		Author author = authorManager.getAuthorByID(id_autora);
		authorManager.deleteAuthor(id_autora);
		
		String realPathToUpload = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\authors";
		path_author = Paths.get(realPathToUpload + "\\" + author.getFirstName() + "_" + author.getLastName() + "_" + author.getAuthorId() + ".jpg");
		if(Files.exists(path_author))
		{
			try{
				Files.delete(path_author);
			}
			catch(IOException e)
			{
				e.printStackTrace();
			}
		}
		return "redirect:/authors/1";
	}
	
	@RequestMapping(value = "/authors/{idAutora}")
	public String getAuthorByID(Model model, @PathVariable("idAutora") Integer id_autora)
	{
		Author author = authorManager.getAuthorByID(id_autora);
		model.addAttribute("author",author);
		return "index4";
		
	}
	
}
