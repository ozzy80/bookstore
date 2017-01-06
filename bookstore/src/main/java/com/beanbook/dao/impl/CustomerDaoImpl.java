package com.beanbook.dao.impl;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.beanbook.dao.CustomerDao;
import com.beanbook.model.Authority;
import com.beanbook.model.Cart;
import com.beanbook.model.Customer;
import com.beanbook.model.Genre;
import com.beanbook.model.User;

@Repository
@Transactional
public class CustomerDaoImpl implements CustomerDao {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public void addCustomer(Customer customer) {
		Session session = sessionFactory.getCurrentSession();
		
		customer.getBillingAddress().setCustomer(customer);
		customer.getShippingAddress().setCustomer(customer);
		
		session.saveOrUpdate(customer);
		session.saveOrUpdate(customer.getBillingAddress());
		session.saveOrUpdate(customer.getShippingAddress());
		
		User newUser = new User();
		newUser.setEnabled(true);
		newUser.setCustomerId(customer.getCustomerId());
		newUser.setPassword(customer.getPassword());
		newUser.setUsername(customer.getUsername());
		
		Authority authority = new Authority();
		authority.setAuthority("ROLE_USER");
		authority.setUsername(customer.getUsername());
		
		session.saveOrUpdate(newUser);
		session.saveOrUpdate(authority);
		
		Cart cart = new Cart();
		cart.setCustomer(customer);
		customer.setCart(cart);
		session.saveOrUpdate(cart);
		session.saveOrUpdate(customer);		
		
		session.flush();
	}

	@Override
	public Customer getCustomer(Integer id) {
		Session session = sessionFactory.getCurrentSession();
		Customer customer =  (Customer) session.get(Genre.class, id);
		session.flush();
		return customer;
	}

	@Override
	public List<Customer> getAllCustomer() {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("from Customer");
		List<Customer> customerList = query.list();
		session.flush();
		return customerList;
	}

}
