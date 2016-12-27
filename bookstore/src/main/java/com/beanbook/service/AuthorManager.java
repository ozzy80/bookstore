package com.beanbook.service;

import com.beanbook.model.Author;

public interface AuthorManager {

	void addAuthor(Author author);
	
	Author getAuthorByID(Integer ID);
	
	void deleteAuthor(Integer id);
}
