package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Author;

public interface AuthorManager {

	void addAuthor(Author author);
	
	Author getAuthorByID(Integer ID);
	
	void deleteAuthor(Integer id);
	
	List<Author> getAllAuthors();
	
	void updateAuthor(Author author);
	
}
