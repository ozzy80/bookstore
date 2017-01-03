package com.beanbook.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "pismo")
public class Letter {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_pisma")
	private Integer letterID;
	
	@Column(name = "Vrsta", length = 20, nullable = false)
	private String letterType;

	public Integer getLetterID() {
		return letterID;
	}

	public void setLetterID(Integer letterID) {
		this.letterID = letterID;
	}

	public String getLetterType() {
		return letterType;
	}

	public void setLetterType(String letterType) {
		this.letterType = letterType;
	}
	
}
