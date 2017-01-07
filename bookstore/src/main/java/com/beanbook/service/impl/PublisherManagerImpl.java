package com.beanbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.PublisherDao;
import com.beanbook.model.Publisher;
import com.beanbook.service.PublisherManager;

@Service
public class PublisherManagerImpl implements PublisherManager {

	@Autowired
	public PublisherDao publisherDao;

	@Override
	public Publisher getPublisherByID(Integer id) {
		return publisherDao.getPublisherByID(id);
	}

	@Override
	public List<Publisher> getAllPublishers() {
		return publisherDao.getAllPublishers();
	}

	@Override
	public void savePublisher(Publisher publisher) {
		publisherDao.savePublisher(publisher);
	}

	@Override
	public void deletePublisher(Integer id) {
		publisherDao.deletePublisher(publisherDao.getPublisherByID(id));
	}

}
