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
	public void addBook(Book book) {
		bookDao.addBook(book);
	}

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
	public void updateBook(Book book)
	{
		bookDao.updateBook(book);
	}
	

}
