package com.beanbook.webapp.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.beanbook.dao.impl.CartDaoImpl;
import com.beanbook.model.Book;
import com.beanbook.model.Cart;
import com.beanbook.model.CartItem;
import com.beanbook.model.Status;
import com.beanbook.service.BookManager;
import com.beanbook.service.CartItemManager;
import com.beanbook.service.CartManager;
import com.beanbook.service.UserManager;

@Controller
@RequestMapping("/rest/cart")
public class CartResources {

	@Autowired
	private CartManager cartManager;

	@Autowired
	private UserManager userManager;

	@Autowired
	private BookManager bookManager;

	@Autowired
	private CartItemManager cartItemManager;

	@RequestMapping(value = "/{cartId}", method = RequestMethod.GET)
	public @ResponseBody Cart getCartById(@PathVariable("cartId") Integer cartId) {
		return cartManager.getCartById(cartId);
	}

	@RequestMapping(value = "/{isbn}", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public @ResponseBody void addItem(@PathVariable("isbn") Long isbn, @AuthenticationPrincipal User activeUser) {

		com.beanbook.model.User user = userManager.getUserByUsername(activeUser.getUsername());
		
		Book book = bookManager.getBookByISBN(isbn);

		Cart cart = cartManager.getActiveUserCart(user);
		
		if(cart == null){
			cart = new Cart();
			cart.setStatus(Status.STARTED);
			cart.setUser(user);
			cart.setOrderDate(Date.valueOf(LocalDate.now()));
			/*CartItem cartItem = new CartItem();
			cartItem.setBook(book);
			cartItem.setQuantity(1);
			cartItem.setPrice(book.getPrice());
			cartItem.setCart(cart);
			cartItemManager.addCartItem(cartItem);*/
		} 
		else {
			List<CartItem> cartItems = cart.getCartItems();
	
			for (int i = 0; i < cartItems.size(); i++) {
				if (book.getIsbn().equals(cartItems.get(i).getBook().getIsbn())) {
					CartItem cartItem = cartItems.get(i);
					cartItem.setQuantity(cartItem.getQuantity() + 1);
					cartItemManager.addCartItem(cartItem);
					
					return;
				}
			}
		}
		CartItem cartItem = new CartItem();
		cartItem.setBook(book);
		cartItem.setQuantity(1);
		cartItem.setPrice(book.getPrice());
		cartItem.setCart(cart);
		cartItemManager.addCartItem(cartItem);
	}

	@RequestMapping(value = "/remove/{isbn}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeItem(@PathVariable("isbn") Long isbn) {
		CartItem cartItem = cartItemManager.getCartItemByISBN(isbn);
		cartItemManager.removeCartItem(cartItem);
	}

	@RequestMapping(value = "/{cartId}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void clearCart(@PathVariable("cartId") Integer cartId) {
		Cart cart = cartManager.getCartById(cartId);
		cartItemManager.removeAllCartItem(cart);
	}

	@ExceptionHandler(IllegalArgumentException.class)
	@ResponseStatus(value = HttpStatus.BAD_REQUEST, reason = "Ilegal request, please verify your payload")
	public void handleClientError(Exception e) {
	}

	@ExceptionHandler(Exception.class)
	@ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason = "Internal Server error")
	public void handleServerError(Exception e) {
	}
}
