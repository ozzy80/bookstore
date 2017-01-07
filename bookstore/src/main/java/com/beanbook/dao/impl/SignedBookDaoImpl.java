package com.beanbook.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beanbook.dao.SignedBookDao;
import com.beanbook.model.SignedBook;

@Repository
@Transactional
public class SignedBookDaoImpl implements SignedBookDao {

	@Autowired
	public SessionFactory sessionFactory;

	@Override
	public SignedBook getSignedBookByISBN(Long ISBN) {
		Session session = sessionFactory.getCurrentSession();
		SignedBook signedBook = (SignedBook) session.get(SignedBook.class, ISBN);
		session.flush();

		return signedBook;
	}

	@Override
	public void addSignedBook(SignedBook signedBook) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(signedBook);
		session.flush();
	}

	@Override
	public List<SignedBook> getAllSignedBooks() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from SignedBook");
		List<SignedBook> signedBookList = query.list();
		session.flush();
		return signedBookList;
	}

	@Override
	public void deleteSignedBook(SignedBook signedBook) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(signedBook);
		session.flush();
	}

	@Override
	public void updateSignedBook(SignedBook signedBook) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(signedBook);
		session.flush();
	}
}
