package com.beanbook.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "zanr")
public class Genre {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_zanra")
	private Integer genreID;

	@Column(name = "Naziv", length = 100, nullable = false)
	private String genreName;

	public Integer getGenreID() {
		return genreID;
	}

	public void setGenreID(Integer genreID) {
		this.genreID = genreID;
	}

	public String getGenreName() {
		return genreName;
	}

	public void setGenreName(String genreName) {
		this.genreName = genreName;
	}

}
