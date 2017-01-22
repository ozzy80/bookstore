package com.beanbook.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beanbook.dao.AuthorDao;
import com.beanbook.dao.AuthorityDao;
import com.beanbook.model.Authority;
import com.beanbook.model.Book;

@Repository
@Transactional
public class AuthorityDaoImpl implements AuthorityDao{

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void updateUserRole(Authority authority) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(authority);
		session.flush();		
	}

	@Override
	public Authority getAuthorityByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Authority where username = :username");
		query.setParameter("username", username);
		Authority authority = (Authority) query.uniqueResult();
		session.flush();

		return authority;
	}

}
