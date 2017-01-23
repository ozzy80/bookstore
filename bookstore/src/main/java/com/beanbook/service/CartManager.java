package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Cart;
import com.beanbook.model.User;

public interface CartManager {

	Cart getCartById(Integer cartId);

	void update(Cart cart);

	Cart getActiveUserCart(User user);

	List<Cart> getAllActiveCarts();
}
