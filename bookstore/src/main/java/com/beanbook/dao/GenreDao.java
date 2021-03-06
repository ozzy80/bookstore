package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.Genre;

public interface GenreDao {

	Genre getGenreByID(Integer ID);

	List<Genre> getAllGenres();

	void saveGenre(Genre genre);

	void deleteGenre(Genre genre);

	long getBooksByGenreNumber(String genre);
}
