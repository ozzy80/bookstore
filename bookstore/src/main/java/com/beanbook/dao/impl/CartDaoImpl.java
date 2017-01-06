package com.beanbook.dao.impl;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beanbook.dao.CartDao;
import com.beanbook.model.Cart;

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
		// TODO Auto-generated method stub
		
	}

}
