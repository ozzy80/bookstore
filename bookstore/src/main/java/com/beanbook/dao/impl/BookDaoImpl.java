package com.beanbook.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beanbook.dao.BookDao;
import com.beanbook.model.Book;

@Repository
@Transactional
public class BookDaoImpl implements BookDao {

	@Autowired
	public SessionFactory sessionFactory;

	@Override
	public List<Book> getAllBooks() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book");
		List<Book> bookList = query.list();
		session.flush();

		return bookList;
	}

	@Override
	public void addBook(Book book) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(book);
		session.flush();
	}

	@Override
	public Book getBookByISBN(Long ISBN) {
		Session session = sessionFactory.getCurrentSession();
		Book book = (Book) session.get(Book.class, ISBN);
		session.flush();

		return book;
	}

	@Override
	public void deleteBook(Book book) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(book);
		session.flush();
	}

	@Override
	public void updateBook(Book book)
	{
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(session);
		session.flush();
	}
	
}
