package com.beanbook.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;


@Entity
@Table(name = "Adresa_kartice")
public class BillingAddress implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1252513432090134362L;

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "Id")
	private Integer billingAddressId;

	@Column(name = "Ulica", length = 255, nullable = false)
	private String streetName;

	@Column(name = "Broj_kuce", length = 255, nullable = false)
	private String apartmentNumber;

	@Column(name = "Grad", length = 255, nullable = false)
	private String city;

	@Column(name = "Provincija", length = 255, nullable = false)
	private String state;

	@Column(name = "Drzava", length = 255, nullable = false)
	private String country;

	@Column(name = "Postanski_broj", length = 255, nullable = false)
	private String postalCode;

	public Integer getBillingAddressId() {
		return billingAddressId;
	}

	public void setBillingAddressId(Integer billingAddressId) {
		this.billingAddressId = billingAddressId;
	}

	public String getStreetName() {
		return streetName;
	}

	public void setStreetName(String streetName) {
		this.streetName = streetName;
	}

	public String getApartmentNumber() {
		return apartmentNumber;
	}

	public void setApartmentNumber(String apartmentNumber) {
		this.apartmentNumber = apartmentNumber;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	@Override
	public String toString() {
		return "BillingAddress [billingAddressId=" + billingAddressId + ", streetName=" + streetName
				+ ", apartmentNumber=" + apartmentNumber + ", city=" + city + ", state=" + state + ", country="
				+ country + ", postalCode=" + postalCode + "]";
	}

}
