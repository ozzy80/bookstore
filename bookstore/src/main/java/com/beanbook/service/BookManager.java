package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Book;

public interface BookManager {

	void saveBook(Book book);

	List<Book> getAllBooks();

	Book getBookByISBN(Long ISBN);

	void deleteBook(Long ISBN);
	
	List<Book> getBooks(String sort,int start,int limit);
	
	List<Book> autocomplete(String query);
	
	List<Book> getBooksByGenre(String genre, int start, int limit, String sortBy);
}
