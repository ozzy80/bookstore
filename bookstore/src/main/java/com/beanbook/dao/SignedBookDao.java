package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.SignedBook;

public interface SignedBookDao {

	SignedBook getSignedBookByISBN(Long ISBN);
	List<SignedBook> getAllSignedBooks();
	void addSignedBook(SignedBook signedBook);
	void deleteSignedBook(SignedBook signedBook);
	void updateSignedBook(SignedBook signedBook);
}
