package com.beanbook.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beanbook.dao.GenreDao;
import com.beanbook.model.Genre;

@Repository
@Transactional
public class GenreDaoImpl implements GenreDao {

	@Autowired
	public SessionFactory sessionFactory;

	@Override
	public Genre getGenreByID(Integer ID) {
		Session session = sessionFactory.getCurrentSession();
		Genre genre = (Genre) session.get(Genre.class, ID);
		session.flush();
		return genre;
	}

	@Override
	public List<Genre> getAllGenres() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Genre");
		List<Genre> genreList = query.list();
		session.flush();
		return genreList;
	}

	@Override
	public void deleteGenre(Genre genre) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(genre);
		session.flush();
	}

	@Override
	public void saveGenre(Genre genre) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(genre);
		session.flush();
	}

}
