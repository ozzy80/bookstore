package com.beanbook.service.impl;

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

}
