package com.beanbook.service;

import java.util.List;

import com.beanbook.model.SignedBook;

public interface SignedBookManager {
	
	SignedBook getSignedBookByISBN(Long ISBN);
	List<SignedBook> getAllSignedBooks();
	void addSignedBook(SignedBook signedBook);
	void deleteSignedBook(Long ISBN);
	void updateSignedBook(SignedBook signedBook);
}
