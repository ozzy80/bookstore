package com.beanbook.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beanbook.model.BillingAddress;
import com.beanbook.model.ShippingAddress;
import com.beanbook.model.User;
import com.beanbook.service.UserManager;

@Controller
public class RegisterController {

	@Autowired
	private UserManager userManager;

	@RequestMapping(value = "/register")
	public String registerCustomer(Model model) {
		User user = new User();
		BillingAddress billingAddress = new BillingAddress();
		ShippingAddress shippingAddress = new ShippingAddress();
		user.setBillingAddress(billingAddress);
		user.setShippingAddress(shippingAddress);

		model.addAttribute("customer", user);

		return "register_customer";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerCustomer(@ModelAttribute("user") User user, Model model) {

		user.setEnabled(true);
		userManager.addUser(user);

		return "register_customer_success";
	}
}
