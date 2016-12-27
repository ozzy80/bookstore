package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.Author;


public interface AuthorDao {

	void addAuthor(Author author);

	Author getAuthorByID(Integer ID);

	void deleteAuthor(Author author);
	
}
