package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Book;

public interface BookManager {

	void saveBook(Book book);

	List<Book> getAllBooks();

	Book getBookByISBN(Long ISBN);

	void deleteBook(Long ISBN);
}
