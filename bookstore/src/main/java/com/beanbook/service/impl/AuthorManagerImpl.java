package com.beanbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.AuthorDao;
import com.beanbook.dao.BookDao;
import com.beanbook.model.Author;
import com.beanbook.service.AuthorManager;

@Service
public class AuthorManagerImpl implements AuthorManager {

	@Autowired
	private AuthorDao authorDao;
	
	@Autowired
	private BookDao bookDao;

	@Override
	public void deleteAuthor(Integer id) {
		authorDao.deleteAuthor(authorDao.getAuthorByID(id));
	}

	@Override
	public Author getAuthorByID(Integer id) {
		return authorDao.getAuthorByID(id);
	}

	@Override
	public List<Author> getAllAuthors() {
		return authorDao.getAllAuthors();
	}

	@Override
	public void saveAuthor(Author author) {
		authorDao.saveAuthor(author);
	}

}
