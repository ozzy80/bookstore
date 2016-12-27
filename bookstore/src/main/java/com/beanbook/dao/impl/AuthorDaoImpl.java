package com.beanbook.dao.impl;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beanbook.dao.AuthorDao;
import com.beanbook.model.Author;


@Repository
@Transactional
public class AuthorDaoImpl implements AuthorDao{

	@Autowired
	public SessionFactory sessionFactory;
	
	@Override
	public void addAuthor(Author author) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(author);
		session.flush();
		
	}

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


	
	
}
