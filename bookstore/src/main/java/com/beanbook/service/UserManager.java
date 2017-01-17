package com.beanbook.service;

import java.util.List;

import com.beanbook.model.User;

public interface UserManager {

	void addUser(User user);

	User getUser(Integer id);

	List<User> getAllUser();

	User getUserByUsername(String username);

}
