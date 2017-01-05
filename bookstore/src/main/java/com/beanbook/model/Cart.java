package com.beanbook.model;

import java.util.HashMap;
import java.util.Map;

public class Cart {
	
	private String cartId;
	
	private Map<Long, CartItem> cartItems;
	
	private double grandTotal;
	
	public Cart() {
		cartItems = new HashMap<>();
		grandTotal = 0;
	}

	public Cart(String cartId) {
		this();
		this.cartId = cartId;
	}

	public String getCartId() {
		return cartId;
	}

	public void setCartId(String cartId) {
		this.cartId = cartId;
	}

	public Map<Long, CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(Map<Long, CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	public double getGrandTotal() {
		return grandTotal;
	}

	public void setGrandTotal(double grandTotal) {
		this.grandTotal = grandTotal;
	}
	
	public void addCartItem(CartItem item){
		Long isbn = item.getBook().getIsbn();
		
		if(cartItems.containsKey(isbn)){
			CartItem existingCartItem = cartItems.get(isbn);
			existingCartItem.setQuantity(existingCartItem.getQuantity() + item.getQuantity());
			cartItems.put(isbn, existingCartItem);
		} else {
			cartItems.put(isbn, item);
		}
		
		updateGrandTotal();
	}
	
	public void removeCartItem(CartItem item){
		Long isbn = item.getBook().getIsbn();
		cartItems.remove(isbn);
		updateGrandTotal();
	}
	
	public void updateGrandTotal(){
		grandTotal = 0;
		for (CartItem item : cartItems.values()) {
			grandTotal += item.getTotalPrice();
		}
	}
	
}
