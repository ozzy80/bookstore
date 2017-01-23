package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.beanbook.model.Letter;
import com.beanbook.service.LetterManager;

@Controller
public class LetterController {

	@Autowired
	private LetterManager letterManager;

	@RequestMapping(value = "/admin/letters", method = RequestMethod.GET)
	public @ResponseBody List<Letter> getAllLetters() {
		return letterManager.getAllLetters();
	}

	@RequestMapping(value = "/admin/letters", method=RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void addLetter(@RequestBody Letter letter) {
		letterManager.saveLetter(letter);
	}

	@RequestMapping(value = "/admin/letters/{id}", method = RequestMethod.GET)
	public @ResponseBody Letter getLetter(@PathVariable("id") Integer id) {
		return letterManager.getLetterByID(id);
	}

	@RequestMapping(value = "/admin/letters/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deleteLetter(@PathVariable("id") Integer id) {
		letterManager.deleteLetter(id);
	}

}
