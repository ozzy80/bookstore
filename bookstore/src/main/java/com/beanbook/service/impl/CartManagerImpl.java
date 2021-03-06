package com.beanbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.CartDao;
import com.beanbook.model.Cart;
import com.beanbook.model.User;
import com.beanbook.service.CartManager;

@Service
public class CartManagerImpl implements CartManager {

	@Autowired
	private CartDao cartDao;

	@Override
	public Cart getCartById(Integer cartId) {
		return cartDao.getCartById(cartId);
	}

	@Override
	public void update(Cart cart) {
		cartDao.update(cart);
	}

	@Override
	public Cart getActiveUserCart(User user) {
		return cartDao.getActiveUserCart(user);
	}

	@Override
	public List<Cart> getAllActiveCarts() {
		return cartDao.getAllActiveCarts();
	}

	@Override
	public List<Cart> getAllWaitedCarts() {
		return cartDao.getAllWaitedCarts();
	}
}
