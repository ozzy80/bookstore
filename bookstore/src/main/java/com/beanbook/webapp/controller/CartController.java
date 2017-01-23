package com.beanbook.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.beanbook.model.Cart;
import com.beanbook.model.CartItem;
import com.beanbook.model.Status;
import com.beanbook.service.CartManager;
import com.beanbook.service.UserManager;

@Controller
@RequestMapping("/customer")
public class CartController {

	@Autowired
	private UserManager userManager;

	@Autowired
	private CartManager cartManager;

	@RequestMapping(value = "/cart")
	public String getCart(@AuthenticationPrincipal User activeUsers) {
		com.beanbook.model.User user = userManager.getUserByUsername(activeUsers.getUsername());

		// check if exists open cart
		Cart cart = cartManager.getActiveUserCart(user);
		if (cart != null) {
			return "redirect:/customer/cart/" + cart.getCartId();
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/cart/{cartId}")
	public String getCartRedirect(@PathVariable("cartId") Integer cartId, Model model, 
			@AuthenticationPrincipal User activeUsers) {
		com.beanbook.model.User user = userManager.getUserByUsername(activeUsers.getUsername());
		
		if(cartId.equals(cartManager.getActiveUserCart(user).getCartId())){
			model.addAttribute("cartId", cartId);
			return "cart";			
		}
		return "redirect:/";
	}

	@RequestMapping(value = "/waitstatus", method = RequestMethod.POST)
	public ResponseEntity<String> setWaitCart(@RequestBody Cart cart, @AuthenticationPrincipal User activeUsers) {
		
		com.beanbook.model.User user = userManager.getUserByUsername(activeUsers.getUsername());
		
		if(cart.getCartItems().size() < 1 || !cart.getCartId().equals(cartManager.getActiveUserCart(user).getCartId())){
			return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
		}
		cart.setStatus(Status.WAIT);
		for (CartItem ci : cart.getCartItems()) {
			ci.setCart(cart);
		}
		cartManager.update(cart);
		return ResponseEntity.status(HttpStatus.OK).body(null);
	}
}
