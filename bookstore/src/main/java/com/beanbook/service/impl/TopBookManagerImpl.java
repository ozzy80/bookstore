package com.beanbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.TopBookDao;
import com.beanbook.model.TopBook;
import com.beanbook.service.TopBookManager;

@Service
public class TopBookManagerImpl implements TopBookManager {

	@Autowired
	private TopBookDao topBookDao;

	@Override
	public TopBook getTopBookById(Integer id) {
		return topBookDao.getTopBookById(id);
	}

	@Override
	public List<TopBook> getAllActiveTopBooks() {
		return topBookDao.getAllActiveTopBooks();
	}

	@Override
	public void saveTopBook(TopBook topBook) {
		topBookDao.saveTopBook(topBook);
	}

	@Override
	public void deleteTopBook(TopBook topBook) {
		topBookDao.deleteTopBook(topBook);
	}

}
