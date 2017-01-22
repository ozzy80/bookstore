<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html ng-app="bookApp">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" type="text/css" />	
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="all" />	
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular.min.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular-resource.min.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/app.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/registerValidationController.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/service.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/dirPagination.js" />"></script> 
  	
  	<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.23/angular.min.js"></script>
  	
	<title>Registrovanje</title>
</head>
<body>
	<div class="container-wrapper2" ng-controller="registerValidationController">
		<div class="container">
			<div class="registerlinkovi">
					<a href="#" class="registerlinkpocetna">Vrati se na početnu</a>
					<a href="#" class="registerlinkpomoc">Pomoć</a>
				</div>
				<div id="loginlogo"><h1><a href="<c:url value="/" />">BeanBook</a></h1></div>
				<br/><br/><br/><br/>
				<h3>Registracija</h3>
				<br/>
				<div class="registerlinija"></div>
				
			<form name="registerForm" ng-submit="submitForm()" method="post" commandName="customer" novalidate="novalidate">
				<h4>Lični podaci</h4>
				
				<div class="form-group" ng-class="{'has-error':registerForm.firstName.$invalid && !registerForm.firstName.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.firstName.$invalid && !registerForm.firstName.$pristine " class="help-block">
							Ime je obavezno!
						</p>
					</div>
					<label for="firstName" class="registerlabel" >Ime:</label>
					<input type="text" name="firstName" ng-model="user.firstName" id="firstName" class="form-control inputregister" required/>
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.lastName.$invalid && !registerForm.lastName.$pristine}">
					<div>
						<p  ng-show="registerForm.lastName.$invalid && !registerForm.lastName.$pristine" class="help-block registracijagreska">
							Prezime je obavezno!
						</p>
					</div>
					<label for="lastName" class="registerlabel">Prezime:</label>
					<input type="text" name="lastName" ng-model="user.lastName" id="lastName" class="form-control inputregister" required/>
					
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.email.$invalid && !registerForm.email.$pristine}">
					<div >
						<p  ng-show="registerForm.email.$invalid && !registerForm.email.$pristine" class="registracijagreska help-block">
							Unesite ispravnu mail adresu!
						</p>
					</div>
					<label for="email" class="registerlabel">Mail:</label>
					<input type="email" name="email" ng-model="user.email" id="email" class="form-control inputregister" required/>
					
				</div>
				<br/><br/>
				<div class="form-group">
					<label for="phone" class="registerlabel">Telefon:</label>
					<input type="text" name="phone" id="phone" class="form-control inputregister"/>
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.username.$invalid && !registerForm.username.$pristine}">
					<div>
						<p ng-show="registerForm.username.$error.minlength" class="registracijagreska help-block">
							Korisničko ime mora sadržati bar 3 karaktera!
						</p>
						<p  ng-show="registerForm.username.$error.maxlength" class="registracijagreska help-block">
							Korisničko ime može sadržati najviše 8 karaktera!
						</p>
					
					</div>
					<label for="username" class="registerlabel">Korisničko ime:</label>
					<input type="text" name="username" ng-model="user.username" id="username" class="form-control inputregister" ng-minlength="3" ng-maxlength="8"/>
					
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.password.$invalid && !registerForm.password.$pristine}">
					<div>
						<p  ng-show="registerForm.password.$invalid && !registerForm.password.$pristine" class="registracijagreska help-block">
							Lozinka je obavezna!
						</p>
					</div>
					<label for="password" class="registerlabel">Lozinka:</label>
					<input type="password" name="password" ng-model="user.password" id="password" class="form-control inputregister" required/>
					
				</div>
				
				<br/><br/>
		
				<h4>Adresa izdavanja kartice</h4>
				<br />
          		<br />
				
				<div class="form-group"  ng-class="{'has-error':registerForm.streetNamesa.$invalid && !registerForm.streetNamesa.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.streetNamesa.$invalid && !registerForm.streetNamesa.$pristine" class="help-block">
							Adresa je obavezna!
						</p>
					</div>
					<label for="streetNamesa" class="registerlabel">Ulica:</label>
					<input type="text" name="streetNamesa" ng-model="user.billingAddress.streetName" id="streetNamesa" class="form-control inputregister" ng-change="sameAddress && kopiraj()" required/>
					
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.apartmentNumbersa.$invalid && !registerForm.apartmentNumbersa.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.apartmentNumbersa.$invalid && !registerForm.apartmentNumbersa.$pristine" class="help-block">
							Broj je obavezan!
						</p>
					</div>
					<label for="apartmentNumbersa" class="registerlabel">Broj:</label>
					<input type="text" name="apartmentNumbersa" ng-model="user.billingAddress.apartmentNumber" id="apartmentNumbersa" class="form-control inputregister" ng-change="sameAddress && kopiraj()" required/>
				</div>
				<br/><br/>
				<div class="form-group"  ng-class="{'has-error':registerForm.citysa.$invalid && !registerForm.citysa.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.citysa.$invalid && !registerForm.citysa.$pristine" class="help-block">
							Grad je obavezan!
						</p>	
					</div>
					<label for="citysa" class="registerlabel">Grad:</label>
					<input type="text" name="citysa" ng-model="user.billingAddress.city" id="citysa" class="form-control inputregister" ng-change="sameAddress && kopiraj()" required/>
					
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.statesa.$invalid && !registerForm.statesa.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.statesa.$invalid && !registerForm.statesa.$pristine" class="help-block">
							Region je obavezan!
						</p>
					</div>
					<label for="statesa" class="registerlabel">Region:</label>
					<input type="text" name="statesa" ng-model="user.billingAddress.state" id="statesa" class="form-control inputregister" ng-change="sameAddress && kopiraj()" required/>
					
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.countrysa.$invalid && !registerForm.countrysa.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.countrysa.$invalid && !registerForm.countrysa.$pristine" class="help-block">
							Država je obavezna!
						</p>
					</div>
					<label for="countrysa" class="registerlabel">Država:</label>
					<input type="text" name="countrysa" ng-model="user.billingAddress.country" id="countrysa" class="form-control inputregister" ng-change="sameAddress && kopiraj()" required/>
					
				</div>
				
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.postalCodesa.$invalid && !registerForm.postalCodesa.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.postalCodesa.$invalid && !registerForm.postalCodesa.$pristine" class="help-block" >
							Poštanski broj je obavezan!
						</p>
					</div>
					<label for="postalCodesa" class="registerlabel">Poštanski kod:</label>
					<input type="text" name="postalCodesa" ng-model="user.billingAddress.postalCode" id="postalCodesa" class="form-control inputregister" ng-change="sameAddress && kopiraj()" required/>
					
				</div>
				<br/><br/>
				<h4>Adresa dostavljanja</h4>
				<input type="checkbox"  ng-model="sameAddress" ng-change="sameAddress && kopiraj()" /><span style="display:inline-block;font-size:10px;">Ista kao adresa izdavanja kartice</span>
				
				<div class="form-group" ng-class="{'has-error':registerForm.streetNameba.$invalid && !registerForm.streetNameba.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.streetNameba.$invalid && !registerForm.streetNameba.$pristine" class="help-block" >
							Adresa je obavezna!
						</p> 
					</div>
					<label for="streetNameba" class="registerlabel">Ulica:</label>
					<input type="text" name="streetNameba" ng-model="user.shippingAddress.streetName" id="streetNameba" class="form-control inputregister" ng-disabled="sameAddress" required/>
					
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.apartmentNumberba.$invalid && !registerForm.apartmentNumberba.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.apartmentNumberba.$invalid && !registerForm.apartmentNumberba.$pristine" class="help-block" >
							Broj je obavezan!
						</p> 
					</div>
					<label for="apartmentNumberba" class="registerlabel">Broj:</label>
					<input type="text" name="apartmentNumberba" ng-model="user.shippingAddress.apartmentNumber" id="apartmentNumberba" class="form-control inputregister" ng-disabled="sameAddress" required/>
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.cityba.$invalid && !registerForm.cityba.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.cityba.$invalid && !registerForm.cityba.$pristine" class="help-block">
							Grad je obavezan!
						</p>
					</div>
					<label for="cityba" class="registerlabel">Grad:</label>
					<input type="text" name="cityba" ng-model="user.shippingAddress.city" id="cityba" class="form-control inputregister" ng-disabled="sameAddress" required/>
					
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.stateba.$invalid && !registerForm.stateba.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.stateba.$invalid && !registerForm.stateba.$pristine" class="help-block">
							Region je obavezan!
						</p>
					</div>
					<label for="stateba" class="registerlabel">Region:</label>
					<input type="text" name="stateba" ng-model="user.shippingAddress.state" id="stateba" class="form-control inputregister" ng-disabled="sameAddress" required/>
					
				</div>	
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.countryba.$invalid && !registerForm.countryba.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.countryba.$invalid && !registerForm.countryba.$pristine" class="help-block">
							Država je obavezna!
						</p>
					</div>
					<label for="countryba" class="registerlabel">Država:</label>
					<input type="text" name="countryba" ng-model="user.shippingAddress.country" id="country2" class="form-control inputregister" ng-disabled="sameAddress" required/>
					
				</div>
				<br/><br/>
				<div class="form-group" ng-class="{'has-error':registerForm.postalCodeba.$invalid && !registerForm.postalCodeba.$pristine}">
					<div>
						<p class="registracijagreska" ng-show="registerForm.postalCodeba.$invalid && !registerForm.postalCodeba.$pristine" class="help-block">
							Poštanski broj je obavezan!
						</p>
					</div>
					<label for="postalCode2" class="registerlabel">Poštanski kod:</label>
					<input type="text" name="postalCodeba" ng-model="user.shippingAddress.postalCode" id="postalCode2" class="form-control inputregister" ng-disabled="sameAddress" required/>
					
				</div>
				<br/><br/>
				<div >		
				<input class="registracijadugme btn btn-warning" type="submit" value="Zapamti" >
				
				</div>
			</form>
		</div>
	</div>
</body>
</html>
