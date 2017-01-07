package com.beanbook.service;

import com.beanbook.model.Cart;

public interface CartManager {

	Cart getCartById(Integer cartId);

	void update(Cart cart);
}
