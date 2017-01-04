package com.beanbook.model;

import java.sql.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

@Entity
@Table(name = "knjiga")
public class Book {

	@Id
	@Column(name = "ISBN")
	private Long isbn;

	@Column(name = "Naziv", length = 100, nullable = false)
	private String title;

	@Column(name = "Opis", columnDefinition = "TEXT")
	private String description;

	@Column(name = "Dostupno_komada", nullable = false)
	private Integer booksInStock;

	@Column(name = "Format", length = 15, nullable = false)
	private String format;

	@Column(name = "Broj_strana", nullable = false)
	private Integer numberOfPages;

	@Column(name = "Godina_izdanja", nullable = false)
	private Date publicationYear;

	@Column(name = "Cena", nullable = false)
	private Double price;

	@Column(name = "Na_popustu")
	private Integer discount;

	@ManyToOne
	@JoinColumn(name = "Izdavac_ID_izdavaca")
	private Publisher publisher;

	@ManyToOne
	@JoinColumn(name = "pismo_ID_pisma")
	private Letter letter;
	
	@Transient
	private MultipartFile bookImage;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(name = "knjiga_ima_autor", joinColumns = {
			@JoinColumn(name = "ISBN") }, inverseJoinColumns = @JoinColumn(name = "ID_autora"))
	private Set<Author> authorList;

	public Letter getLetter() {
		return letter;
	}
	
	public void setLetter(Letter letter) {
		this.letter = letter;
	}

	public MultipartFile getBookImage() {
		return bookImage;
	}

	public void setBookImage(MultipartFile bookImage) {
		this.bookImage = bookImage;
	}

	public Long getIsbn() {
		return isbn;
	}

	public void setIsbn(Long isbn) {
		this.isbn = isbn;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getBooksInStock() {
		return booksInStock;
	}

	public void setBooksInStock(Integer booksInStock) {
		this.booksInStock = booksInStock;
	}

	public String getFormat() {
		return format;
	}

	public void setFormat(String format) {
		this.format = format;
	}

	public Integer getNumberOfPages() {
		return numberOfPages;
	}

	public void setNumberOfPages(Integer numberOfPages) {
		this.numberOfPages = numberOfPages;
	}

	public Date getPublicationYear() {
		return publicationYear;
	}

	public void setPublicationYear(Date publicationYear) {
		this.publicationYear = publicationYear;
	}

	public Set<Author> getAuthorList() {
		return authorList;
	}

	public void setAuthorList(Set<Author> authorList) {
		this.authorList = authorList;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public Publisher getPublisher() {
		return publisher;
	}

	public void setPublisher(Publisher publisher) {
		this.publisher = publisher;
	}

	
	
}
