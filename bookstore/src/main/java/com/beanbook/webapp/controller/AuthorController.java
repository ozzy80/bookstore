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
import com.beanbook.service.AuthorManager;


@Controller
public class AuthorController {

	@Autowired
	private AuthorManager authorManager;
	
	private Path path_author;

	
	
	@RequestMapping(value = "/authors")
	public String getAllAuthors(Model model)
	{
		List<Author> authorList = authorManager.getAllAuthors();
		model.addAttribute("authors", authorList);
		return "all_authors";
	}
	
	
	@RequestMapping(value="/authors/add")
	public String addAuthor(Model model)
	{
		model.addAttribute("author",new Author());
		return "add_author";
	}
	
	@RequestMapping(value="/authors/update/{authorID}")
	public String updateAuthor(Model model,@PathVariable("authorID") Integer id)
	{
		Author author = authorManager.getAuthorByID(id);
		model.addAttribute("author",author);
		return "update_author";
	}
	
	

	@RequestMapping(value = "/authors/update/new")
	public String updateAuthor(@ModelAttribute("author") Author author)
	{
		authorManager.updateAuthor(author);
		return "redirect:/authors";	
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
		return "redirect:/authors";
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
		return "redirect:/authors";
	}
	
	
	@RequestMapping(value = "/authors/{idAutora}")
	public String getAuthorByID(Model model, @PathVariable("idAutora") Integer id_autora)
	{
		Author author = authorManager.getAuthorByID(id_autora);
		model.addAttribute("author",author);
		return "index4";
		
	}
	
	
}