package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.Book;

public interface BookDao {

	void saveBook(Book book);

	List<Book> getAllBooks();

	Book getBookByISBN(Long ISBN);

	void deleteBook(Book book);
	
	List<Book> getBooks(String sort,int start,int limit);
	
	List<Book> autocomplete(String query);
	
	List<Book> getBooksByGenre(String genre, int start, int limit, String sortBy);
	
	List<Book> getBooksByAuthor(Integer id); 
}
