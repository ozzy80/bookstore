package com.beanbook.model;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer userId;

	@Column(name = "username", length = 50, nullable = false)
	private String username;

	@Column(name = "password", length = 255, nullable = false)
	private String password;

	@Column(name = "enabled", nullable = false)
	private Boolean enabled;

	@Column(name = "ime", length = 45, nullable = false)
	private String firstName;
	
	@Column(name = "prezime", length = 45, nullable = false)
	private String lastName;
	
	@Column(name = "email", length = 255, nullable = false)
	private String email;
	
	@Column(name = "telefon", length = 45, nullable = false)
	private String phone;
	
	@OneToOne
	@JoinColumn(name="Adresa_karticeId")
	private BillingAddress billingAddress;
	
	@OneToOne
	@JoinColumn(name="Adresa_isporukeId")
	private ShippingAddress shippingAddress;
	
	@OneToMany
	@JoinColumn(name="cartId")
	@JsonIgnore
	private List<Cart> cartList;

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
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

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public ShippingAddress getShippingAddress() {
		return shippingAddress;
	}

	public void setShippingAddress(ShippingAddress shippingAddress) {
		this.shippingAddress = shippingAddress;
	}

	public List<Cart> getCartList() {
		return cartList;
	}

	public void setCartList(List<Cart> cartList) {
		this.cartList = cartList;
	}

	public BillingAddress getBillingAddress() {
		return billingAddress;
	}

	public void setBillingAddress(BillingAddress billingAddress) {
		this.billingAddress = billingAddress;
	}

}
