package com.beanbook.dao.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.beanbook.dao.CartDao;
import com.beanbook.model.Cart;

@Repository
public class CartDaoImpl implements CartDao {

	private Map<String, Cart> listOfCarts;
	
	public CartDaoImpl() {
		this.listOfCarts = new HashMap<>();
	}	
	
	public CartDaoImpl(Map<String, Cart> listOfCarts) {
		super();
		this.listOfCarts = listOfCarts;
	}

	@Override
	public Cart create(Cart cart) {
		if(listOfCarts.keySet().contains(cart.getCartId())){
			throw new IllegalArgumentException(String.format("Cannot create a cart", cart.getCartId()));
		}
	
		listOfCarts.put(cart.getCartId(), cart);
		return cart;
	}

	@Override
	public Cart read(String cartId) {
		return listOfCarts.get(cartId);
	}

	@Override
	public void update(String cartId, Cart cart) {
		if(!listOfCarts.keySet().contains(cartId)){
			throw new IllegalArgumentException(String.format("Cannot update a cart", cart.getCartId()));
		}
		listOfCarts.put(cartId, cart);
	}

	@Override
	public void delete(String cartId) {
		if(!listOfCarts.keySet().contains(cartId)){
			throw new IllegalArgumentException(String.format("Cannot delete a cart", cartId));
		}
		listOfCarts.remove(cartId);
	}

}
