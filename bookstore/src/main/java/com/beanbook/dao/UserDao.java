package com.beanbook.dao;

import java.util.List;

import com.beanbook.model.User;

public interface UserDao {

	void addUser(User user);

	User getUser(Integer id);

	List<User> getAllUser();

	User getUserByUsername(String username);
}
