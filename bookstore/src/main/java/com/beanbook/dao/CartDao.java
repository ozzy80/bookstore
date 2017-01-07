package com.beanbook.dao;

import com.beanbook.model.Cart;

public interface CartDao {
	Cart getCartById(Integer cartId);

	void update(Cart cart);
}
