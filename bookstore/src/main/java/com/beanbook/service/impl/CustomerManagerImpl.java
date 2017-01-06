package com.beanbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.CustomerDao;
import com.beanbook.model.Customer;
import com.beanbook.service.CustomerManager;

@Service
public class CustomerManagerImpl implements CustomerManager{

	@Autowired
	private CustomerDao customerDao;
	
	@Override
	public void addCustomer(Customer customer) {
		customerDao.addCustomer(customer);
		
	}

	@Override
	public Customer getCustomer(Integer id) {
		return customerDao.getCustomer(id);
	}

	@Override
	public List<Customer> getAllCustomer() {
		return customerDao.getAllCustomer();
	}

	@Override
	public Customer getCustomerByUsername(String username) {
		return customerDao.getCustomerByUsername(username);
	}

	
	
}
