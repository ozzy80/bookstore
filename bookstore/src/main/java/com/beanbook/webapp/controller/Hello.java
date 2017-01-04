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
import com.beanbook.model.Letter;
import com.beanbook.service.AuthorManager;
import com.beanbook.service.BookManager;
import com.beanbook.service.LetterManager;
import com.beanbook.service.PublisherManager;

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
	
	@Autowired 
	private LetterManager letterManager;

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
	
	@RequestMapping(value = "/letters")
	public String getAllLetters(Model model)
	{
		List<Letter> letterList = letterManager.getAllLetters();
		model.addAttribute("letters",letterList);
		return "all_letters";
	}

	@RequestMapping(value = "/books/{isbn}")
	public String getBookByISBN(Model model, @PathVariable("isbn") Long isbn) {
		Book book = bookManager.getBookByISBN(isbn);
		model.addAttribute("book", book);

		return "index3";
	}

	@RequestMapping(value="/books/update/{isbn}")
	public String updateBook(Model model,@PathVariable("isbn") Long isbn)
	{
		Book book = bookManager.getBookByISBN(isbn);
		model.addAttribute("book", book);
		return "update_book";
	}
	
	@RequestMapping(value="/letters/update/{letterID}")
	public String updateLetter(Model model, @PathVariable("letterID") Integer letterID)
	{
		Letter letter = letterManager.getLetterByID(letterID);
		model.addAttribute("letter", letter);
		return "update_letter";
	}
	
	@RequestMapping(value = "/books/update/new")
	public String updateBook(@ModelAttribute("book") Book book)
	{
		
		book.setPublisher(publisherManager.getPublisherByID(1));
		book.setLetter(letterManager.getLetterByID(1));
		bookManager.updateBook(book);
		return "redirect:/books";
	}
	    		
	@RequestMapping(value="/letters/update/new")
	public String updateLetter(@ModelAttribute("letter") Letter letter)
	{
		letterManager.updateLetter(letter);
		return "redirect:/letters";
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
	
	@RequestMapping(value="/letters/add")
	public String addLetter(Model model)
	{
		model.addAttribute("letter",new Letter());
		return "add_letter";
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
	
	@RequestMapping(value="/letters/add/new",method = RequestMethod.POST)
	public String addLetter(@ModelAttribute("letter") Letter letter)
	{
		
		letterManager.addLetter(letter);
		return "redirect:/letters";
 
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

	@RequestMapping(value = "/letters/del/{idPisma}")
	public String deleteLetter(@PathVariable("idPisma") Integer id_pisma)
	{
		letterManager.deleteLetter(id_pisma);
		return "redirect:/letters";

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
	
	@RequestMapping(value = "/letters/{idPisma}")
	public String getLetterByID(Model model, @PathVariable("idPisma") Integer id_letter)
	{
		Letter letter = letterManager.getLetterByID(id_letter);
		model.addAttribute("letter",letter);
		return "index5";
		
	}
	
}
