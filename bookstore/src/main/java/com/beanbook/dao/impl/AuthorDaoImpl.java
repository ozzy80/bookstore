package com.beanbook.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beanbook.dao.AuthorDao;
import com.beanbook.model.Author;

@Repository
@Transactional
public class AuthorDaoImpl implements AuthorDao {

	@Autowired
	public SessionFactory sessionFactory;

	@Override
	public Author getAuthorByID(Integer ID) {
		Session session = sessionFactory.getCurrentSession();
		Author author = (Author) session.get(Author.class, ID);
		session.flush();
		return author;
	}

	@Override
	public void deleteAuthor(Author author) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(author);
		session.flush();

	}

	@Override
	public List<Author> getAllAuthors() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Author");
		List<Author> authorList = query.list();
		session.flush();
		return authorList;
	}

	@Override
	public void saveAuthor(Author author) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(author);
		session.flush();
	}
}
