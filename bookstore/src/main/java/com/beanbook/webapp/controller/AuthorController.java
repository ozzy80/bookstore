package com.beanbook.webapp.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beanbook.model.Author;
import com.beanbook.service.AuthorManager;

@Controller
public class AuthorController {

	@Autowired
	private AuthorManager authorManager;

	@Autowired
	FileUploadController file;

	@RequestMapping(value = "/authors")
	public String getAllAuthors(Model model) {
		List<Author> authorList = authorManager.getAllAuthors();
		model.addAttribute("authors", authorList);
		return "all_authors";
	}

	@RequestMapping(value = "/authors/add")
	public String addAuthor(Model model) {
		model.addAttribute("author", new Author());
		return "add_author";
	}

	@RequestMapping(value = "/authors/add", method = RequestMethod.POST)
	public String addAuthor(@ModelAttribute("author") Author author, HttpServletRequest request) {
		authorManager.saveAuthor(author);

		String realPathToUpload = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\authors";
		String imageName = author.getFirstName() + "_" + author.getLastName() + "_" + author.getAuthorId() + ".jpg";
		file.uploadPicture(author.getAuthorImage(), imageName, realPathToUpload);

		return "redirect:/authors";
	}

	@RequestMapping(value = "/authors/update/{authorID}")
	public String updateAuthor(Model model, @PathVariable("authorID") Integer id) {
		Author author = authorManager.getAuthorByID(id);
		model.addAttribute("author", author);
		return "update_author";
	}

	@RequestMapping(value = "/authors/update", method = RequestMethod.POST)
	public String updateAuthor(@ModelAttribute("author") Author author) {

		String realPathToUpload = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\authors";

		if (author.getAuthorImage() != null && !author.getAuthorImage().isEmpty()) {
			Author oldAuthor = authorManager.getAuthorByID(author.getAuthorId());
			String imageName = oldAuthor.getFirstName() + "_" + oldAuthor.getLastName() + "_" + oldAuthor.getAuthorId()
					+ ".jpg";
			file.deletePicture(imageName, realPathToUpload);
		}
		authorManager.saveAuthor(author);

		String imageName = author.getFirstName() + "_" + author.getLastName() + "_" + author.getAuthorId() + ".jpg";
		file.uploadPicture(author.getAuthorImage(), imageName, realPathToUpload);

		return "redirect:/authors";
	}

	@RequestMapping(value = "/authors/del/{idAutora}")
	public String deleteAuthor(@PathVariable("idAutora") Integer id_autora) {
		Author author = authorManager.getAuthorByID(id_autora);
		authorManager.deleteAuthor(id_autora);

		String realPathToUpload = "C:\\dev\\bookstore\\bookstore\\src\\main\\webapp\\WEB-INF\\resources\\images\\authors";
		String imageName = author.getFirstName() + "_" + author.getLastName() + "_" + author.getAuthorId() + ".jpg";
		file.deletePicture(imageName, realPathToUpload);

		return "redirect:/authors";
	}

	@RequestMapping(value = "/authors/{idAutora}")
	public String getAuthorByID(Model model, @PathVariable("idAutora") Integer id_autora) {
		Author author = authorManager.getAuthorByID(id_autora);
		model.addAttribute("author", author);
		return "index4";

	}

}
