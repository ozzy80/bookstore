package com.beanbook.service;

import java.util.List;

import com.beanbook.model.TopBook;

public interface TopBookManager {
	TopBook getTopBookById(Integer id);

	List<TopBook> getAllActiveTopBooks();

	void saveTopBook(TopBook topBook);

	void deleteTopBook(TopBook topBook);
}
