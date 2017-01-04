package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Book;

public interface BookManager {

	void addBook(Book book);

	List<Book> getAllBooks();

	Book getBookByISBN(Long ISBN);

	void deleteBook(Long ISBN);
	
	void updateBook(Book book);
}
