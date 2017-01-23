package com.beanbook.webapp.controller;

import java.sql.Date;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.beanbook.model.Book;
import com.beanbook.model.Cart;
import com.beanbook.model.CartItem;
import com.beanbook.model.Status;
import com.beanbook.service.BookManager;
import com.beanbook.service.CartItemManager;
import com.beanbook.service.CartManager;
import com.beanbook.service.UserManager;

@Controller
public class CartResources {

	@Autowired
	private CartManager cartManager;

	@Autowired
	private UserManager userManager;

	@Autowired
	private BookManager bookManager;

	@Autowired
	private CartItemManager cartItemManager;

	@RequestMapping(value = "/customer/{cartId}", method = RequestMethod.GET)
	public @ResponseBody Cart getCartById(@PathVariable("cartId") Integer cartId, 
			@AuthenticationPrincipal User activeUsers) {
		com.beanbook.model.User user = userManager.getUserByUsername(activeUsers.getUsername());
		if(!cartId.equals(cartManager.getActiveUserCart(user).getCartId())){
			return null;			
		}
		return cartManager.getCartById(cartId);
	}

	@RequestMapping(value = "/customer", method = RequestMethod.GET)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public @ResponseBody void addItem(@RequestParam("isbn") Long isbn, @RequestParam("num") Integer num,
			@AuthenticationPrincipal User activeUser) {

		com.beanbook.model.User user = userManager.getUserByUsername(activeUser.getUsername());

		Book book = bookManager.getBookByISBN(isbn);
		Cart cart = cartManager.getActiveUserCart(user);

		if (cart == null) {
			cart = new Cart();
			cart.setStatus(Status.STARTED);
			cart.setUser(user);
			cart.setOrderDate(Date.valueOf(LocalDate.now()));
			cart.setBillingAddress(user.getBillingAddress());
			cart.setShippingAddress(user.getShippingAddress());
		} else {
			List<CartItem> cartItems = cart.getCartItems();

			for (int i = 0; i < cartItems.size(); i++) {
				if (book.getIsbn().equals(cartItems.get(i).getBook().getIsbn())) {
					CartItem cartItem = cartItems.get(i);
					cartItem.setQuantity(cartItem.getQuantity() + num);
					cartItemManager.addCartItem(cartItem);

					return;
				}
			}
		}
		CartItem cartItem = new CartItem();
		cartItem.setBook(book);
		cartItem.setQuantity(num);
		if(book.getDiscount() != null){
			cartItem.setPrice(book.getPrice() - book.getPrice()/100*book.getDiscount());
		}
		else{
			cartItem.setPrice(book.getPrice());
		}
		cartItem.setCart(cart);
		cartItemManager.addCartItem(cartItem);
	}

	@RequestMapping(value = "/customer/remove/{cartId}/{cartItemId}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void removeItem(@PathVariable("cartItemId") Integer cartItemId,
			@PathVariable("cartId") Integer cartId, @AuthenticationPrincipal User activeUsers) {
		
		com.beanbook.model.User user = userManager.getUserByUsername(activeUsers.getUsername());
		if(!cartId.equals(cartManager.getActiveUserCart(user).getCartId())){
			return;			
		}
		
		Cart cart = cartManager.getCartById(cartId);
		List<CartItem> c = cart.getCartItems();
		CartItem ci = cartItemManager.getCartItemById(cartItemId);
		c.remove(ci);
		cart.setCartItems(c);
		System.out.println(c.size());
		cartManager.update(cart);
		cartItemManager.removeCartItem(cartItemId);
	}

	@RequestMapping(value = "/customer/{cartId}", method = RequestMethod.DELETE)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void clearCart(@PathVariable("cartId") Integer cartId, @AuthenticationPrincipal User activeUsers) {
		
		com.beanbook.model.User user = userManager.getUserByUsername(activeUsers.getUsername());
		if(!cartId.equals(cartManager.getActiveUserCart(user).getCartId())){
			return;			
		}
		
		Cart cart = cartManager.getCartById(cartId);
		cartItemManager.removeAllCartItem(cart);
	}

	// ADMIN
	@RequestMapping(value = "admin/cartnumber", method = RequestMethod.GET)
	public @ResponseBody List<Cart> getAllActiveCarts() {
		return cartManager.getAllWaitedCarts();
	}

	@RequestMapping(value = "admin/cart/status", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void changeCartStatus(@RequestBody Cart cart) {
		Cart c = cartManager.getCartById(cart.getCartId());
		if(cart.getStatus() == Status.DENIDED)
			c.setStatus(Status.DENIDED);
		else{
			c.setStatus(Status.APPROVED);
			c.setOrderDate(Date.valueOf(LocalDate.now()));
		}
		cartManager.update(c);;
	}
	
	/*
	 * @ExceptionHandler(IllegalArgumentException.class)
	 * 
	 * @ResponseStatus(value = HttpStatus.BAD_REQUEST, reason =
	 * "Ilegal request, please verify your payload") public void
	 * handleClientError(Exception e) { }
	 * 
	 * @ExceptionHandler(Exception.class)
	 * 
	 * @ResponseStatus(value = HttpStatus.INTERNAL_SERVER_ERROR, reason =
	 * "Internal Server error") public void handleServerError(Exception e) { }
	 */
}
