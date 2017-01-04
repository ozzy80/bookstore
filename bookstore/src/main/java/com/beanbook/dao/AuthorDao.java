package com.beanbook.dao;

import com.beanbook.model.Author;

public interface AuthorDao {

	void addAuthor(Author author);

	Author getAuthorByID(Integer ID);

	void deleteAuthor(Author author);

}
