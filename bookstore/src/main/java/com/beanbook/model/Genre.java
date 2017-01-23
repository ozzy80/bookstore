package com.beanbook.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "zanr")
public class Genre implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -5104794987207900986L;

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
