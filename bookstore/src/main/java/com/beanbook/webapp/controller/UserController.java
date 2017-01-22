package com.beanbook.webapp.controller;

import java.util.List;

import org.apache.tomcat.dbcp.pool2.UsageTracking;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.beanbook.model.Authority;
import com.beanbook.model.User;
import com.beanbook.service.AuthorityManager;
import com.beanbook.service.UserManager;

@Controller
public class UserController {

	@Autowired
	private UserManager userManager;
	
	@Autowired
	private AuthorityManager authorityManager;
		
	@RequestMapping(value = "admin/users", method = RequestMethod.GET)
	public @ResponseBody List<User> getUsers(){
		return userManager.getAllUser();
	}
	
	@RequestMapping(value = "admin/users", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void banRole(@RequestBody User user){
		userManager.addUser(user);
	}
	
	@RequestMapping(value = "admin/users/role", method = RequestMethod.POST)
	@ResponseStatus(value = HttpStatus.NO_CONTENT)
	public void changeAdminUserRole(@RequestBody User user){
		Authority authority = authorityManager.getAuthorityByUsername(user.getUsername());
		if(authority.getAuthority().equals("ROLE_ADMIN")){
			authority.setAuthority("ROLE_USER");
		}
		else{
			authority.setAuthority("ROLE_ADMIN");
		}
		authorityManager.updateUserRole(authority);	
	}
	
	@RequestMapping(value = "admin/users/role/{username}", method = RequestMethod.GET)
	public @ResponseBody Authority getUserRole(@PathVariable("username") String username){
		return authorityManager.getAuthorityByUsername(username);
	}
}
