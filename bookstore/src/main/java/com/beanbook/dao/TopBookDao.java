package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.TopBook;

public interface TopBookDao {

	TopBook getTopBookById(Integer id);

	List<TopBook> getAllActiveTopBooks();

	void saveTopBook(TopBook topBook);

	void deleteTopBook(TopBook topBook);
}
