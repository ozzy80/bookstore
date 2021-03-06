package com.beanbook.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authorities")
public class Authority implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -7075135461029248170L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer authorityId;

	@Column(length = 45, nullable = false)
	private String username;

	@Column(length = 45, nullable = false)
	private String authority;

	public Integer getAuthorityId() {
		return authorityId;
	}

	public void setAuthorityId(Integer authorityId) {
		this.authorityId = authorityId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

}
