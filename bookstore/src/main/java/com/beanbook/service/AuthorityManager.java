package com.beanbook.service;

import com.beanbook.model.Authority;

public interface AuthorityManager {

	void updateUserRole(Authority authority);
	
	Authority getAuthorityByUsername(String username);
}
