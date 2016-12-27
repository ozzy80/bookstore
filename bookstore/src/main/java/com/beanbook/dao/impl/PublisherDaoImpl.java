package com.beanbook.dao.impl;

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

}
