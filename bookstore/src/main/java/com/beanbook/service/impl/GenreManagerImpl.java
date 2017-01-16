package com.beanbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.GenreDao;
import com.beanbook.model.Genre;
import com.beanbook.service.GenreManager;

@Service
public class GenreManagerImpl implements GenreManager {

	@Autowired
	private GenreDao genreDao;

	@Override
	public Genre getGenreByID(Integer id) {
		return genreDao.getGenreByID(id);
	}

	@Override
	public List<Genre> getAllGenres() {
		return genreDao.getAllGenres();
	}

	@Override
	public void saveGenre(Genre genre) {
		genreDao.saveGenre(genre);
	}

	@Override
	public void deleteGenre(Integer id) {
		genreDao.deleteGenre(genreDao.getGenreByID(id));
	}

	@Override
	public long getBooksByGenreNumber(String genre) {
		return genreDao.getBooksByGenreNumber(genre);
	}

}
