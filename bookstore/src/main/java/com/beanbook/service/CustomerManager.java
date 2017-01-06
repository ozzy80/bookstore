package com.beanbook.service;

import java.util.List;

import com.beanbook.model.Customer;

public interface CustomerManager {
	
	void addCustomer(Customer customer);
	
	Customer getCustomer(Integer id);
	
	List<Customer> getAllCustomer();

	Customer getCustomerByUsername(String username);
	
}
