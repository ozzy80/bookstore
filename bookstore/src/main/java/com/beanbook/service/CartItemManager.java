package com.beanbook.service;

import com.beanbook.model.Cart;
import com.beanbook.model.CartItem;

public interface CartItemManager {

	void addCartItem(CartItem cartItem);

	void removeCartItem(Integer id);

	void removeAllCartItem(Cart cart);
	
	CartItem getCartItemById(Integer id);
}
