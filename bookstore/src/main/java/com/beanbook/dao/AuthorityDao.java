package com.beanbook.dao;

import com.beanbook.model.Authority;

public interface AuthorityDao {

	void updateUserRole(Authority authority);

	Authority getAuthorityByUsername(String username);
}
