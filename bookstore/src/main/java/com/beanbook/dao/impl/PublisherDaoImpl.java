package com.beanbook.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beanbook.dao.PublisherDao;
import com.beanbook.model.Publisher;

@Repository
@Transactional
public class PublisherDaoImpl implements PublisherDao {

	@Autowired
	public SessionFactory sessionFactory;

	@Override
	public Publisher getPublisherByID(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Publisher publisher = (Publisher) session.get(Publisher.class, id);
		session.flush();

		return publisher;
	}

	
	@Override
	public List<Publisher> getAllPublishers()
	{
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Publisher");
		List<Publisher> publisherList = query.list();
		session.flush();
		
		return publisherList;
	}
	
	@Override 
	public void addPublisher(Publisher publisher)
	{
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(publisher);
		session.flush();
	}
	
	@Override 
	public void deletePublisher(Publisher publisher)
	{
		Session session = sessionFactory.getCurrentSession();
		session.delete(publisher);
		session.flush();
	}
	
	
	@Override 
	public void updatePublisher(Publisher publisher)
	{
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(publisher);
		session.flush();
	}
	
}
