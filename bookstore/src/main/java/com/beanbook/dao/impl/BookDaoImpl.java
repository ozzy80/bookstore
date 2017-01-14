package com.beanbook.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.transform.Transformers;
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
	public void saveBook(Book book) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(book);
		session.flush();
	}

	@Override
	public List<Book> getBooks(String sort, int start, int limit) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Book order by publicationYear " 
				+ (sort.equals("desc")?"desc" : "asc"));
		
		//query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		query.setFirstResult(start);
		query.setMaxResults(limit);
		List<Book> bookList = query.list();
		session.flush();

		return bookList;
	}

	@Override
	public List<Book> autocomplete(String query) {
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("select isbn as isbn, title as title "
				+ "from Book where title like :query1 or title like :query2 "
				+ "order by publicationYear");
	
		q.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		q.setParameter("query1", "% "+query+"%");
		q.setParameter("query2",  query+"%");
		q.setMaxResults(7);
		List<Book> bookList = q.list();
		session.flush();

		return bookList;
	}

	@Override
	public List<Book> getBooksByGenre(String genre) {
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery("select b from Book b join b.genreList g where g.genreName = :genre "
				+ "order by b.publicationYear");

		q.setParameter("genre", genre);
		List<Book> bookList = q.list();
		session.flush();

		return bookList;
	}

}
