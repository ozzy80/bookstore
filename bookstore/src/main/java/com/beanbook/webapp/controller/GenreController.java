package com.beanbook.webapp.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beanbook.model.Genre;
import com.beanbook.service.GenreManager;

@Controller
public class GenreController {

	@Autowired
	private GenreManager genreManager;

	@RequestMapping(value = "/genres")
	public String getAllGenres(Model model)
	{
		List<Genre> genreList = genreManager.getAllGenres();
		model.addAttribute("genres", genreList);
		return "all_genres";
	}

	
	@RequestMapping(value = "/genres/update/{genreID}")
	public String updateGenre(Model model, @PathVariable("genreID") Integer genre_id)
	{
		Genre genre = genreManager.getGenreByID(genre_id);
		model.addAttribute("genre", genre);
		return "update_genre";
	}
	
	
	@RequestMapping(value = "/genres/update/new")
	public String updateGenre(@ModelAttribute("genre") Genre genre)
	{
		genreManager.updateGenre(genre);
		return "redirect:/genres";
	}
	
	
	@RequestMapping(value="/genres/add/new",method = RequestMethod.POST)
	public String addGenre(@ModelAttribute("genre") Genre genre)
	{
		genreManager.addGenre(genre);
		return "redirect:/genres";
	}
	
	
	@RequestMapping(value="/genres/del/{idGenre}")
	public String deleteGenre(@PathVariable("idGenre") Integer id_genre)
	{
		genreManager.deleteGenre(id_genre);
		return "redirect:/genres";
	}
	
	
	@RequestMapping(value = "/genres/{idGenre}")
	public String getGenreByID(Model model, @PathVariable("idGenre") Integer id_genre)
	{
		Genre genre = genreManager.getGenreByID(id_genre);
		model.addAttribute("genre",genre);
		return "index7";
	}

	
	@RequestMapping(value="/genres/add")
	public String addGenre(Model model)
	{
		model.addAttribute("genre", new Genre());
		return "add_genre";
	}
	
}

