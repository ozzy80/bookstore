<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Registrovanje</title>
</head>
<body>
	<form:form action="${pageContext.request.contextPath}/register" method="post" commandName="customer">
		<h3>Basic info</h3>
		
		<div class="form-group">
			<label for="name">Ime</label>
			<form:input path="firstName" id="name" class="form-Controlor"/>
		</div>
		
		<div class="form-group">
			<label for="name">Prezime</label>
			<form:input path="lastName" id="name" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="email">Email</label>
			<form:input path="email" id="email" class="form-Controlor"/>
		</div>
		
		<div class="form-group">
			<label for="phone">Telefon</label>
			<form:input path="phone" id="phone" class="form-Controlor"/>
		</div>

		<div class="form-group">
			<label for="username">Username</label>
			<form:input path="username" id="username" class="form-Controlor"/>
		</div>

		<div class="form-group">
			<label for="password">Password</label>
			<form:password path="password" id="password" class="form-Controlor"/>
		</div>


		<h3>Billing address</h3>
		
		<div class="form-group">
			<label for="streetName">Ime ulice</label>
			<form:input path="billingAddress.streetName" id="streetName" class="form-Controlor"/>
		</div>

		<div class="form-group">
			<label for="apartmentNumber">Broj</label>
			<form:input path="billingAddress.apartmentNumber" id="apartmentNumber" class="form-Controlor"/>
		</div>

		<div class="form-group">
			<label for="city">Grad</label>
			<form:input path="billingAddress.city" id="city" class="form-Controlor"/>
		</div>

		<div class="form-group">
			<label for="state">Region</label>
			<form:input path="billingAddress.state" id="state" class="form-Controlor"/>
		</div>

		<div class="form-group">
			<label for="country">Drzava</label>
			<form:input path="billingAddress.country" id="country" class="form-Controlor"/>
		</div>
				
		<div class="form-group">
			<label for="postalCode">Postanski kod</label>
			<form:input path="billingAddress.postalCode" id="postalCode" class="form-Controlor"/>
		</div>

		<h3>Shipping address</h3>
		
		<div class="form-group">
			<label for="streetName">Ime ulice</label>
			<form:input path="shippingAddress.streetName" id="streetName" class="form-Controlor"/>
		</div>

		<div class="form-group">
			<label for="apartmentNumber">Broj</label>
			<form:input path="shippingAddress.apartmentNumber" id="apartmentNumber" class="form-Controlor"/>
		</div>

		<div class="form-group">
			<label for="city">Grad</label>
			<form:input path="shippingAddress.city" id="city" class="form-Controlor"/>
		</div>

		<div class="form-group">
			<label for="state">Region</label>
			<form:input path="shippingAddress.state" id="state" class="form-Controlor"/>
		</div>

		<div class="form-group">
			<label for="country">Drzava</label>
			<form:input path="shippingAddress.country" id="country" class="form-Controlor"/>
		</div>
				
		<div class="form-group">
			<label for="postalCode">Postanski kod</label>
			<form:input path="shippingAddress.postalCode" id="postalCode" class="form-Controlor"/>
		</div>

				
		<input type="submit" value="submit" class="btn btn-default">
		<a href="<c:url value="/" />" class="btn btn-default">Cancel</a>
	</form:form>
</body>
</html>