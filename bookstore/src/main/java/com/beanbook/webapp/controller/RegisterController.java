package com.beanbook.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.beanbook.model.Authority;
import com.beanbook.model.BillingAddress;
import com.beanbook.model.ShippingAddress;
import com.beanbook.model.User;
import com.beanbook.service.AuthorityManager;
import com.beanbook.service.UserManager;

@Controller
public class RegisterController {

	@Autowired
	private UserManager userManager;
	
	@Autowired
	private AuthorityManager authorityManager;

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
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void registerCustomer(@RequestBody User user) {

		user.setEnabled(true);
		userManager.addUser(user);
		
		Authority authority = new Authority();
		authority.setAuthority("ROLE_USER");
		authority.setUsername(user.getUsername());
		authorityManager.updateUserRole(authority);
	}
}
