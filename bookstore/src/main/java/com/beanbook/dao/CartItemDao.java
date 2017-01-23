package com.beanbook.dao;

import com.beanbook.model.Cart;
import com.beanbook.model.CartItem;

public interface CartItemDao {

	void addCartItem(CartItem cartItem);

	void removeCartItem(CartItem cartItem); 
	
	void removeAllCartItem(Cart cart);

	CartItem getCartItemById(Integer id);
}
