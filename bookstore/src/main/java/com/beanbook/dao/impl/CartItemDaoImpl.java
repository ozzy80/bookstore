package com.beanbook.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.beanbook.dao.CartItemDao;
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
	public CartItem getCartItemByISBN(Long isbn) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from CartItem where book.isbn = :isbn");
		query.setLong("isbn", isbn);

		return (CartItem) query.uniqueResult();
	}

}
