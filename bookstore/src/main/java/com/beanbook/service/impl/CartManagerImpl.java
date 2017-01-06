package com.beanbook.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.CartDao;
import com.beanbook.model.Cart;
import com.beanbook.service.CartManager;

@Service
public class CartManagerImpl implements CartManager{

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

}
