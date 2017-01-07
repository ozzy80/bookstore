package com.beanbook.webapp.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/cart")
public class CartItemController {

	@RequestMapping
	public String get(HttpServletRequest request) {
		return "redirect:/cart/" + request.getSession(true).getId();
	}

	@RequestMapping("/{id}")
	public String getCart(@PathVariable(value = "id") String cartId, Model model) {
		model.addAttribute("cartId", cartId);

		return "cart";
	}

}
