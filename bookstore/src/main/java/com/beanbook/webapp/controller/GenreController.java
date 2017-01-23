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

import com.beanbook.model.Genre;
import com.beanbook.service.GenreManager;

@Controller
public class GenreController {

	@Autowired
	private GenreManager genreManager;

	@RequestMapping(value = "/genres", method = RequestMethod.GET)
	public @ResponseBody List<Genre> getAllGenres(Model model) {
		return genreManager.getAllGenres();
	}

	@RequestMapping(value = "/admin/genres", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void addGenre(@RequestBody Genre genre) {
		genreManager.saveGenre(genre);
	}

	@RequestMapping(value = "/admin/genres/{id}", method = RequestMethod.GET)
	public @ResponseBody Genre getGenre(@PathVariable("id") Integer id) {
		return genreManager.getGenreByID(id);
	}

	@RequestMapping(value = "/admin/genres/{id}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void deleteGenre(@PathVariable("id") Integer id) {
		genreManager.deleteGenre(id);
	}

	@RequestMapping(value = "genres/booknumber", method = RequestMethod.GET)
	public @ResponseBody Map<String, Long> getBooksByGenreNumber(@RequestParam(value = "genre") String genre) {
		Map<String, Long> m = new HashMap<>();

		if (genre.isEmpty()) {
			m.put("number", 0l);
		} else {
			m.put("number", genreManager.getBooksByGenreNumber(genre));
		}

		return m;
		// return genreManager.getBooksByGenreNumber(genre);
	}

}
