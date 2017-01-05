package com.beanbook.model;

public class CartItem {

	private Book book;
	
	private int quantity;
	
	private double totalPrice;

	public CartItem() {
		
	}
	
	public CartItem(Book book) {
		this.book = book;
		this.quantity = 1;
		this.totalPrice = book.getPrice();
	}

	public Book getBook() {
		return book;
	}

	public void setBook(Book book) {
		this.book = book;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}


}
