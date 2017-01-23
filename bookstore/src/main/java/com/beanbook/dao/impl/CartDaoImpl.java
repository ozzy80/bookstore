package com.beanbook.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beanbook.dao.CartDao;
import com.beanbook.model.Cart;
import com.beanbook.model.Status;
import com.beanbook.model.User;

@Repository
@Transactional
public class CartDaoImpl implements CartDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public Cart getCartById(Integer cartId) {
		Session session = sessionFactory.getCurrentSession();
		Cart cart = (Cart) session.get(Cart.class, cartId);
		session.flush();
		return cart;
	}

	@Override
	public void update(Cart cart) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(cart);
		session.flush();
	}

	@Override
	public Cart getActiveUserCart(User user) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Cart where user = ? and status = ?");
		query.setParameter(0, user);
		query.setParameter(1, Status.STARTED);
		Cart cart = (Cart) query.uniqueResult();
		session.flush();
		return cart;
	}

	@Override
	public List<Cart> getAllActiveCarts() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Cart where status = :status");
		query.setParameter("status", Status.STARTED);
		List<Cart> cart = query.list();
		session.flush();

		return cart;
	}

}
