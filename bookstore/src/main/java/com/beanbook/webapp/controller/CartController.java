package com.beanbook.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beanbook.model.Cart;
import com.beanbook.service.CartManager;
import com.beanbook.service.UserManager;



@Controller
@RequestMapping("/customer/cart")
public class CartController {

	@Autowired
	private UserManager userManager;

	@Autowired
	private CartManager cartManager;
	
	@RequestMapping
	public String getCart(@AuthenticationPrincipal User activeUsers) {
		com.beanbook.model.User user = userManager.getUserByUsername(activeUsers.getUsername());
		
		//check if exists open cart
		Cart cart = cartManager.getActiveUserCart(user);
		if(cart != null){
			return "redirect:/customer/cart/"+cart.getCartId();
		}

		return "redirect:/";
	}

	@RequestMapping(value = "/{cartId}")
	public String getCartRedirect(@PathVariable("cartId") Integer cartId, Model model) {
		model.addAttribute("cartId", cartId);

		return "cart";
	}
}
