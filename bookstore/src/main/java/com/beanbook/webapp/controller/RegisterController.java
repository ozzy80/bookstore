package com.beanbook.webapp.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.beanbook.model.BillingAddress;
import com.beanbook.model.Customer;
import com.beanbook.model.ShippingAddress;
import com.beanbook.service.CustomerManager;

@Controller
public class RegisterController {

	@Autowired
	private CustomerManager customerManager;

	@RequestMapping(value = "/register")
	public String registerCustomer(Model model) {
		Customer customer = new Customer();
		BillingAddress billingAddress = new BillingAddress();
		ShippingAddress shippingAddress = new ShippingAddress();
		customer.setBillingAddress(billingAddress);
		customer.setShippingAddress(shippingAddress);

		model.addAttribute("customer", customer);

		return "register_customer";
	}

	@RequestMapping(value = "/register", method = RequestMethod.POST)
	public String registerCustomer(@ModelAttribute("customer") Customer customer, Model model) {

		customer.setEnabled(true);
		customerManager.addCustomer(customer);

		return "register_customer_success";
	}
}
