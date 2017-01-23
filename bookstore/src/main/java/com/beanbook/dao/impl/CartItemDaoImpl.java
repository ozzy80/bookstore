package com.beanbook.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beanbook.dao.CartItemDao;
import com.beanbook.model.Book;
import com.beanbook.model.Cart;
import com.beanbook.model.CartItem;

@Repository
@Transactional
public class CartItemDaoImpl implements CartItemDao {

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void addCartItem(CartItem cartItem) {
		Session session = sessionFactory.getCurrentSession();
		session.saveOrUpdate(cartItem.getCart());
		cartItem.setCart(cartItem.getCart());
		session.saveOrUpdate(cartItem);
		session.flush();

	}

	@Override
	public void removeCartItem(CartItem cartItem) {
		Session session = sessionFactory.getCurrentSession();
		session.delete(cartItem);
		session.flush();
	}

	@Override
	public void removeAllCartItem(Cart cart) {
		List<CartItem> cartItems = cart.getCartItems();
		for (CartItem cartItem : cartItems) {
			removeCartItem(cartItem);
		}
	}

	@Override
	public CartItem getCartItemById(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		CartItem cartItem = (CartItem) session.get(CartItem.class, id);
		session.flush();
		session.flush();
		return cartItem;
	}

}
