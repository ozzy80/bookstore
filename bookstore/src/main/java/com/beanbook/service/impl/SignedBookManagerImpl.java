package com.beanbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.SignedBookDao;
import com.beanbook.model.SignedBook;
import com.beanbook.service.SignedBookManager;

@Service
public class SignedBookManagerImpl implements SignedBookManager {

	@Autowired
	private SignedBookDao signedBookDao;

	@Override
	public SignedBook getSignedBookByISBN(Long ISBN) {
		return signedBookDao.getSignedBookByISBN(ISBN);
	}

	@Override
	public List<SignedBook> getAllSignedBooks() {
		return signedBookDao.getAllSignedBooks();
	}

	@Override
	public void saveSignedBook(SignedBook signedBook) {
		signedBookDao.saveSignedBook(signedBook);
	}

	@Override
	public void deleteSignedBook(Long ISBN) {
		signedBookDao.deleteSignedBook(signedBookDao.getSignedBookByISBN(ISBN));
	}

}
