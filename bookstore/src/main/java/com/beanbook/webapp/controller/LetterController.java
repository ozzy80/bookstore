package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beanbook.model.Letter;
import com.beanbook.service.LetterManager;

@Controller
public class LetterController {

	@Autowired
	private LetterManager letterManager;

	@RequestMapping(value = "/letters")
	public String getAllLetters(Model model) {
		List<Letter> letterList = letterManager.getAllLetters();
		model.addAttribute("letters", letterList);
		return "all_letters";
	}

	@RequestMapping(value = "/letters/update/{letterID}")
	public String updateLetter(Model model, @PathVariable("letterID") Integer letterID) {
		Letter letter = letterManager.getLetterByID(letterID);
		model.addAttribute("letter", letter);
		return "update_letter";
	}

	@RequestMapping(value = "/letters/update", method = RequestMethod.POST)
	public String updateLetter(@ModelAttribute("letter") Letter letter) {
		letterManager.updateLetter(letter);
		return "redirect:/letters";
	}

	@RequestMapping(value = "/letters/add")
	public String addLetter(Model model) {
		model.addAttribute("letter", new Letter());
		return "add_letter";
	}

	@RequestMapping(value = "/letters/add", method = RequestMethod.POST)
	public String addLetter(@ModelAttribute("letter") Letter letter) {
		letterManager.addLetter(letter);
		return "redirect:/letters";
	}

	@RequestMapping(value = "/letters/del/{idPisma}")
	public String deleteLetter(@PathVariable("idPisma") Integer id_pisma) {
		letterManager.deleteLetter(id_pisma);
		return "redirect:/letters";
	}

	@RequestMapping(value = "/letters/{idPisma}")
	public String getLetterByID(Model model, @PathVariable("idPisma") Integer id_letter) {
		Letter letter = letterManager.getLetterByID(id_letter);
		model.addAttribute("letter", letter);
		return "index5";
	}

}
