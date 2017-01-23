package com.beanbook.model;

import javax.persistence.Entity;
import javax.persistence.Table;
import javax.persistence.Id;

import java.io.Serializable;

import javax.persistence.Column;

@Entity
@Table(name = "potpisane_knjige")
public class SignedBook implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3527172443764838941L;

	@Id
	@Column(name = "ISBN")
	private Long isbn;

	@Column(name = "Komada", nullable = false)
	private Integer signedBooksNumber;

	public Long getIsbn() {
		return isbn;
	}

	public void setIsbn(Long isbn) {
		this.isbn = isbn;
	}

	public Integer getSignedBooksNumber() {
		return signedBooksNumber;
	}

	public void setSignedBooksNumber(Integer signedBooksNumber) {
		this.signedBooksNumber = signedBooksNumber;
	}

}
