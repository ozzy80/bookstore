package com.beanbook.dao;

import com.beanbook.model.Cart;
import com.beanbook.model.User;

public interface CartDao {
	Cart getCartById(Integer cartId);

	void update(Cart cart);
	
	Cart getActiveUserCart(User user);
}
