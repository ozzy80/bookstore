package com.beanbook.webapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.multipart.MultipartFile;

import com.beanbook.model.Author;
import com.beanbook.model.Book;
import com.beanbook.service.AuthorManager;
import com.beanbook.service.BookManager;

@Controller
public class AuthorController {

	@Autowired
	private AuthorManager authorManager;

	@Autowired
	private BookManager bookManager;

	@Autowired
	FileUploadController file;

	@RequestMapping(value = "/admin/authors", method = RequestMethod.GET)
	public @ResponseBody List<Author> getAllAuthors() {
		List<Author> authorList = authorManager.getAllAuthors();
		return authorList;
	}

	@RequestMapping(value = "/admin/authors", method = RequestMethod.POST)
	public @ResponseBody Map<String, Integer> addAuthor(@RequestBody Author author) {
		authorManager.saveAuthor(author);
		Map<String, Integer> id = new HashMap<>();
		id.put("id", author.getAuthorId());
		return id;
	}

	@RequestMapping(value = "/admin/authors/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deleteAuthor(@PathVariable("id") Integer id) {
		Author author = authorManager.getAuthorByID(id);
		authorManager.deleteAuthor(id);

		String realPathToUpload = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\authors";
		String imageName = author.getFirstName() + "_" + author.getLastName() + "_" + author.getAuthorId() + ".jpg";
		file.deletePicture(imageName, realPathToUpload);
	}

	@RequestMapping(value = "/admin/authors/{id}", method = RequestMethod.GET)
	public @ResponseBody Author getAuthor(@PathVariable("id") Integer id) {
		return authorManager.getAuthorByID(id);
	}

	@RequestMapping(value = "/authors/{idAutora}")
	public String getAuthorByID(Model model, @PathVariable("idAutora") Integer id_autora) {
		Author author = authorManager.getAuthorByID(id_autora);
		model.addAttribute("author", author);
		return "author_description";
	}

	@RequestMapping(value = "/authors/books", method = RequestMethod.GET)
	public @ResponseBody List<Book> getAuthorBooks(@RequestParam(value = "id", required = true) Integer id) {
		return bookManager.getBooksByAuthor(id);
	}

	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = "admin/upload")
	public void uploadPicture(@RequestParam("file") MultipartFile imgFile, @RequestParam("imageName") String imageName,
			@RequestParam("id") String id) {

		String realPathToUpload = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\authors";
		file.uploadPicture(imgFile, imageName, realPathToUpload);
	}

	@ResponseStatus(value = HttpStatus.OK)
	@RequestMapping(value = "admin/deletepicture", method = RequestMethod.GET)
	public void deletePicture(@RequestParam("id") Integer id) {

		String realPathToUpload = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\authors";
		Author oldAuthor = authorManager.getAuthorByID(id);
		String imageName = oldAuthor.getFirstName() + "_" + oldAuthor.getLastName() + "_" + oldAuthor.getAuthorId()
				+ ".jpg";
		file.deletePicture(imageName, realPathToUpload);
	}
}
