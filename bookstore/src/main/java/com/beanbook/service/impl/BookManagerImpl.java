package com.beanbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.BookDao;
import com.beanbook.model.Book;
import com.beanbook.service.BookManager;

@Service
public class BookManagerImpl implements BookManager {

	@Autowired
	private BookDao bookDao;

	@Override
	public List<Book> getAllBooks() {
		return bookDao.getAllBooks();
	}

	@Override
	public Book getBookByISBN(Long ISBN) {
		return bookDao.getBookByISBN(ISBN);
	}

	@Override
	public void deleteBook(Long ISBN) {
		bookDao.deleteBook(bookDao.getBookByISBN(ISBN));
	}

	@Override
	public void saveBook(Book book) {
		bookDao.saveBook(book);
	}

	@Override
	public List<Book> getBooks(String sort, int start, int limit) {
		return bookDao.getBooks(sort, start, limit);
	}

	@Override
	public List<Book> autocomplete(String query) {
		//Remove whitespaces from begin
		String q = query.replaceAll("^\\s+", "");
		return bookDao.autocomplete(query);
	}

	@Override
	public List<Book> getBooksByGenre(String genre) {
		return bookDao.getBooksByGenre(genre);
	}

}
