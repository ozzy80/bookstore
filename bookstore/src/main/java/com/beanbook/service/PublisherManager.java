package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Publisher;

public interface PublisherManager {

	public Publisher getPublisherByID(Integer id);

	List<Publisher> getAllPublishers();

	void savePublisher(Publisher publisher);

	void deletePublisher(Integer id);
}
