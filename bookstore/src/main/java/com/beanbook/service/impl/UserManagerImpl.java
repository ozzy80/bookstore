package com.beanbook.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.UserDao;
import com.beanbook.model.User;
import com.beanbook.service.UserManager;

@Service
public class UserManagerImpl implements UserManager {

	@Autowired
	private UserDao userDao;

	@Override
	public void addUser(User user) {
		userDao.addUser(user);
	}

	@Override
	public User getUser(Integer id) {
		return userDao.getUser(id);
	}

	@Override
	public List<User> getAllUser() {
		return userDao.getAllUser();
	}

	@Override
	public User getUserByUsername(String username) {
		return userDao.getUserByUsername(username);
	}

}
