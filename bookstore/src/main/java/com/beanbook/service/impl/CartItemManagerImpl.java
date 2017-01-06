package com.beanbook.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.CartItemDao;
import com.beanbook.model.Cart;
import com.beanbook.model.CartItem;
import com.beanbook.service.CartItemManager;

@Service
public class CartItemManagerImpl implements CartItemManager{

	@Autowired
	private CartItemDao cartItemDao; 
	
	@Override
	public void addCartItem(CartItem cartItem) {
		cartItemDao.addCartItem(cartItem);
	}

	@Override
	public void removeCartItem(CartItem cartItem) {
		cartItemDao.removeCartItem(cartItem);
	}

	@Override
	public void removeAllCartItem(Cart cart) {
		cartItemDao.removeAllCartItem(cart);
	}

	@Override
	public CartItem getCartItemByISBN(Long isbn) {
		return cartItemDao.getCartItemByISBN(isbn);
	}

}
