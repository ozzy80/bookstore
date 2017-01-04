package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Genre;

public interface GenreManager {
	
	Genre getGenreByID(Integer ID);
	
	List<Genre> getAllGenres();
	
	void addGenre(Genre genre);
	
	void deleteGenre(Integer id);
	
	void updateGenre(Genre genre);
}
