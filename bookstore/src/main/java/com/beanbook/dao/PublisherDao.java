package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.Publisher;

public interface PublisherDao {

	Publisher getPublisherByID(Integer id);
	List<Publisher> getAllPublishers();
	void addPublisher(Publisher publisher);
	void deletePublisher(Publisher publisher);
	void updatePublisher(Publisher publisher);
	
	
}
