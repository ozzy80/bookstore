package com.beanbook.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.AuthorDao;
import com.beanbook.model.Author;
import com.beanbook.service.AuthorManager;

@Service
public class AuthorManagerImpl implements AuthorManager{

	@Autowired
	private AuthorDao authorDao;
	
	@Override 
	public void addAuthor(Author author)
	{
		authorDao.addAuthor(author);
	}
	
	@Override 
	public void deleteAuthor(Integer id)
	{
		authorDao.deleteAuthor(authorDao.getAuthorByID(id));
	}
	
	@Override 
	public Author getAuthorByID(Integer id)
	{
		return authorDao.getAuthorByID(id);
	}
	
	
	
	
	
}
