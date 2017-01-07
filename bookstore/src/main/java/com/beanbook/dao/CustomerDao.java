package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.Customer;

public interface CustomerDao {

	void addCustomer(Customer customer);

	Customer getCustomer(Integer id);

	List<Customer> getAllCustomer();

	Customer getCustomerByUsername(String username);
}
