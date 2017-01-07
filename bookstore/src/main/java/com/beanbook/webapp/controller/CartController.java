package com.beanbook.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.beanbook.model.Customer;
import com.beanbook.service.CustomerManager;

@Controller
@RequestMapping("/customer/cart")
public class CartController {

	@Autowired
	private CustomerManager customerManager;

	@RequestMapping
	public String getCart(@AuthenticationPrincipal User activeUsers) {
		Customer customer = customerManager.getCustomerByUsername(activeUsers.getUsername());
		Integer cartId = customer.getCart().getCartId();

		return "redirect:/customer/cart/" + cartId;
	}

	@RequestMapping(value = "/{cartId}")
	public String getCartRedirect(@PathVariable("cartId") Integer cartId, Model model) {
		model.addAttribute("cartId", cartId);

		return "cart";
	}
}
