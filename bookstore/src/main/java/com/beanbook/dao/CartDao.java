package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.Cart;
import com.beanbook.model.User;

public interface CartDao {
	Cart getCartById(Integer cartId);

	void update(Cart cart);

	Cart getActiveUserCart(User user);

	List<Cart> getAllActiveCarts();
	
	List<Cart> getAllWaitedCarts();
}
