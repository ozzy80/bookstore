package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beanbook.model.SignedBook;
import com.beanbook.service.SignedBookManager;

@Controller
public class SignedBookController {

	@Autowired
	private SignedBookManager signedBookManager;

	@RequestMapping(value = "/signedbooks")
	public String getAllSignedBooks(Model model) {
		List<SignedBook> signedBookList = signedBookManager.getAllSignedBooks();
		model.addAttribute("signedbooks", signedBookList);
		return "all_signed_books";

	}

	@RequestMapping(value = "/signedbooks/update/{isbn}")
	public String updateSignedBook(Model model, @PathVariable("isbn") Long isbn) {
		SignedBook signedBook = signedBookManager.getSignedBookByISBN(isbn);
		model.addAttribute("signedbook", signedBook);
		return "update_signed_book";
	}

	@RequestMapping(value = "/signedbooks/update", method = RequestMethod.POST)
	public String updateSignedBook(@ModelAttribute("signedBook") SignedBook signedBook) {
		signedBookManager.updateSignedBook(signedBook);
		return "redirect:/signedbooks";
	}

	@RequestMapping(value = "/signedbooks/add")
	public String addSignedBook(Model model) {
		model.addAttribute("signedbook", new SignedBook());
		return "add_signed_book";
	}

	@RequestMapping(value = "/signedbooks/add", method = RequestMethod.POST)
	public String addSignedBook(@ModelAttribute("signedBook") SignedBook signedBook) {
		signedBookManager.addSignedBook(signedBook);
		return "redirect:/signedbooks";
	}

	@RequestMapping(value = "/signedbooks/del/{isbn}")
	public String deleteSignedBook(@PathVariable("isbn") Long isbn) {
		signedBookManager.deleteSignedBook(isbn);
		return "redirect:/signedbooks";
	}

	@RequestMapping(value = "/signedbooks/{idSignedBook}")
	public String getSignedBookByISBN(Model model, @PathVariable("idSignedBook") Long isbn) {
		SignedBook signedBook = signedBookManager.getSignedBookByISBN(isbn);
		model.addAttribute("signedBook", signedBook);
		return "index7";
	}

}
