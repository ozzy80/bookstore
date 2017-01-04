package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Publisher;

public interface PublisherManager {

	public Publisher getPublisherByID(Integer id);
	List<Publisher> getAllPublishers();
	void addPublisher(Publisher publisher);
	void deletePublisher(Integer id);
	void updatePublisher(Publisher publisher);
}
