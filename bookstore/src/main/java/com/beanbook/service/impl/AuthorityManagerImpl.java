package com.beanbook.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.beanbook.dao.AuthorityDao;
import com.beanbook.model.Authority;
import com.beanbook.service.AuthorityManager;

@Service
public class AuthorityManagerImpl implements AuthorityManager {

	@Autowired
	private AuthorityDao authorityDao;
	
	@Override
	public void updateUserRole(Authority authority) {
		authorityDao.updateUserRole(authority);
	}

	@Override
	public Authority getAuthorityByUsername(String username) {
		return authorityDao.getAuthorityByUsername(username);
	}

}
