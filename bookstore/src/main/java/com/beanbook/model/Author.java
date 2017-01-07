package com.beanbook.model;

import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonBackReference;

@Entity
@Table(name = "autor")
public class Author {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "ID_autora")
	private Integer authorId;

	@Column(name = "Ime", length = 45, nullable = false)
	private String firstName;

	@Column(name = "Prezime", length = 45, nullable = false)
	private String lastName;

	@Column(name = "Opis", columnDefinition = "TEXT")
	private String description;

	@Transient
	private MultipartFile authorImage;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "knjiga_ima_autor", joinColumns = {
			@JoinColumn(name = "ID_autora") }, inverseJoinColumns = @JoinColumn(name = "ISBN"))
	@JsonBackReference
	private Set<Book> bookList;

	public Set<Book> getBookList() {
		return bookList;
	}

	public void setBookList(Set<Book> bookList) {
		this.bookList = bookList;
	}

	public Integer getAuthorId() {
		return authorId;
	}

	public void setAuthorId(Integer authorId) {
		this.authorId = authorId;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getDescription() {
		return description;
	}

	public MultipartFile getAuthorImage() {
		return authorImage;
	}

	public void setAuthorImage(MultipartFile authorImage) {
		this.authorImage = authorImage;
	}

	public void setDescription(String description) {
		this.description = description;
	}

}
