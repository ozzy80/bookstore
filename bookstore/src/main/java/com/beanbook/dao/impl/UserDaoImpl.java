package com.beanbook.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beanbook.dao.UserDao;
import com.beanbook.model.Authority;
import com.beanbook.model.Cart;
import com.beanbook.model.Genre;
import com.beanbook.model.User;

@Repository
@Transactional
public class UserDaoImpl implements UserDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addUser(User user) {
		Session session = sessionFactory.getCurrentSession();

		session.saveOrUpdate(user.getBillingAddress());
		session.saveOrUpdate(user.getShippingAddress());
		session.saveOrUpdate(user);

		session.flush();
	}

	@Override
	public User getUser(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		User user = (User) session.get(User.class, id);
		session.flush();
		return user;
	}

	@Override
	public List<User> getAllUser() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User");
		List<User> userList = query.list();
		session.flush();
		return userList;
	}

	@Override
	public User getUserByUsername(String username) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from User where username = ?");
		query.setString(0, username);
		User user = (User) query.uniqueResult();
		session.flush();
		return user;
	}

}
