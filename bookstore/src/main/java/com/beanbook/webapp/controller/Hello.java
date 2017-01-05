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

	

	@RequestMapping(value = "/")
	public String home() {
		return "index";
	}
			
}
