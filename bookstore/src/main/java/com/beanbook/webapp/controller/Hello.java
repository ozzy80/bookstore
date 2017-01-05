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
import com.beanbook.model.Genre;
import com.beanbook.model.Letter;
import com.beanbook.model.Publisher;
import com.beanbook.model.SignedBook;
import com.beanbook.service.AuthorManager;
import com.beanbook.service.BookManager;
import com.beanbook.service.GenreManager;
import com.beanbook.service.LetterManager;
import com.beanbook.service.PublisherManager;
import com.beanbook.service.SignedBookManager;

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
	
	@Autowired
	private GenreManager genreManager;
	
	@Autowired
	private SignedBookManager signedBookManager;

	@RequestMapping(value = "/")
	public String home() {
		
		return "index";
	}
	
	@RequestMapping(value = "/letters")
	public String getAllLetters(Model model)
	{
		List<Letter> letterList = letterManager.getAllLetters();
		model.addAttribute("letters",letterList);
		return "all_letters";
	}
	
	@RequestMapping(value = "/genres")
	public String getAllGenres(Model model)
	{
		List<Genre> genreList = genreManager.getAllGenres();
		model.addAttribute("genres", genreList);
		return "all_genres";
	}
	
	@RequestMapping(value = "/publishers")
	public String getAllPublishers(Model model)
	{
		List<Publisher> publisherList = publisherManager.getAllPublishers();
		model.addAttribute("publishers", publisherList);
		return "all_publishers";
	}
	
	@RequestMapping(value = "/signedbooks")
	public String getAllSignedBooks(Model model)
	{
		List<SignedBook> signedBookList = signedBookManager.getAllSignedBooks();
		model.addAttribute("signedbooks", signedBookList);
		return "all_signed_books";
		
	}
	
	@RequestMapping(value="/publishers/update/{publisherID}")
	public String updatePublisher(Model model,@PathVariable("publisherID") Integer publisherID)
	{
		Publisher publisher = publisherManager.getPublisherByID(publisherID);
		model.addAttribute("publisher", publisher);
		return "update_publisher";
	}
	
	
	@RequestMapping(value="/letters/update/{letterID}")
	public String updateLetter(Model model, @PathVariable("letterID") Integer letterID)
	{
		Letter letter = letterManager.getLetterByID(letterID);
		model.addAttribute("letter", letter);
		return "update_letter";
	}
	
	@RequestMapping(value = "/genres/update/{genreID}")
	public String updateGenre(Model model, @PathVariable("genreID") Integer genre_id)
	{
		Genre genre = genreManager.getGenreByID(genre_id);
		model.addAttribute("genre", genre);
		return "update_genre";
	}
	
	
	@RequestMapping(value="/signedbooks/update/{isbn}")
	public String updateSignedBook(Model model,@PathVariable("isbn") Long isbn)
	{
		SignedBook signedBook = signedBookManager.getSignedBookByISBN(isbn);
		model.addAttribute("signedbook", signedBook);
		return "update_signed_book";
	}
	
	
	@RequestMapping(value = "/signedbooks/update/new")
	public String updateSignedBook(@ModelAttribute("signedBook") SignedBook signedBook)
	{
		signedBookManager.updateSignedBook(signedBook);
		return "redirect:/signedbooks";
	}
	
	
	
	
	
	@RequestMapping(value="/publishers/update/new")
	public String updatePublisher(@ModelAttribute("publisher") Publisher publisher)
	{
		publisherManager.updatePublisher(publisher);
		return "redirect:/publishers";
	}
	
		    		
	@RequestMapping(value="/letters/update/new")
	public String updateLetter(@ModelAttribute("letter") Letter letter)
	{
		letterManager.updateLetter(letter);
		return "redirect:/letters";
	}
		
	
	@RequestMapping(value = "/genres/update/new")
	public String updateGenre(@ModelAttribute("genre") Genre genre)
	{
		genreManager.updateGenre(genre);
		return "redirect:/genres";
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
	
	@RequestMapping(value="/publishers/add")
	public String addPublisher(Model model)
	{
		model.addAttribute("publisher", new Publisher());
		return "add_publisher";
	}
	
	@RequestMapping(value="/genres/add")
	public String addGenre(Model model)
	{
		model.addAttribute("genre", new Genre());
		return "add_genre";
	}
	
	@RequestMapping(value="/signedbooks/add")
	public String addSignedBook(Model model)
	{
		model.addAttribute("signedbook", new SignedBook());
		return "add_signed_book";
	}
	
	@RequestMapping(value="/signedbooks/add/new",method = RequestMethod.POST)
	public String addSignedBook(@ModelAttribute("signedBook") SignedBook signedBook)
	{
		signedBookManager.addSignedBook(signedBook);
		return "redirect:/signedbooks";
	}
	
	@RequestMapping(value="/letters/add/new",method = RequestMethod.POST)
	public String addLetter(@ModelAttribute("letter") Letter letter)
	{
		letterManager.addLetter(letter);
		return "redirect:/letters";
	}	
	
	@RequestMapping(value="/genres/add/new",method = RequestMethod.POST)
	public String addGenre(@ModelAttribute("genre") Genre genre)
	{
		genreManager.addGenre(genre);
		return "redirect:/genres";
	}
	
	@RequestMapping(value="/publishers/add/new",method = RequestMethod.POST)
	public String addPublisher(@ModelAttribute("publisher") Publisher publisher)
	{
		publisherManager.addPublisher(publisher);
		return "redirect:/publishers";
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

	@RequestMapping(value = "/letters/del/{idPisma}")
	public String deleteLetter(@PathVariable("idPisma") Integer id_pisma)
	{
		letterManager.deleteLetter(id_pisma);
		return "redirect:/letters";

	}
	
	@RequestMapping(value="/genres/del/{idGenre}")
	public String deleteGenre(@PathVariable("idGenre") Integer id_genre)
	{
		genreManager.deleteGenre(id_genre);
		return "redirect:/genres";
	}
	
	@RequestMapping(value="/publishers/del/{idPublishera}")
	public String deletePublisher(@PathVariable("idPublishera") Integer id_publishera)
	{
		publisherManager.deletePublisher(id_publishera);
		return "redirect:/publishers";
	}
	
	@RequestMapping(value="/signedbooks/del/{isbn}")
	public String deleteSignedBook(@PathVariable("isbn") Long isbn)
	{
		signedBookManager.deleteSignedBook(isbn);
		return "redirect:/signedbooks";
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
	
	@RequestMapping(value = "/publishers/{idPublishera}")
	public String getPublisherByID(Model model, @PathVariable("idPublishera") Integer id_publishera)
	{
		Publisher publisher = publisherManager.getPublisherByID(id_publishera);
		model.addAttribute("publisher", publisher);
		return "index6";
	}
	
	@RequestMapping(value = "/signedbooks/{idSignedBook}")
	public String getSignedBookByISBN(Model model, @PathVariable("idSignedBook") Long isbn)
	{
		SignedBook signedBook = signedBookManager.getSignedBookByISBN(isbn);
		model.addAttribute("signedBook", signedBook);
		return "index7";
	}
	
	@RequestMapping(value = "/letters/{idPisma}")
	public String getLetterByID(Model model, @PathVariable("idPisma") Integer id_letter)
	{
		Letter letter = letterManager.getLetterByID(id_letter);
		model.addAttribute("letter",letter);
		return "index5";
		
	}
	
	@RequestMapping(value = "/genres/{idGenre}")
	public String getGenreByID(Model model, @PathVariable("idGenre") Integer id_genre)
	{
		Genre genre = genreManager.getGenreByID(id_genre);
		model.addAttribute("genre",genre);
		return "index7";
	}
	
}
