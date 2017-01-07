package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.Book;

public interface BookDao {

	void saveBook(Book book);

	List<Book> getAllBooks();

	Book getBookByISBN(Long ISBN);

	void deleteBook(Book book);
}
