<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css" />" >
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular.min.js" />"></script> 
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular-resource.min.js" />"></script> 
  	<script type="text/javascript" src="<c:url value="/resources/js/app.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/cartController.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/service.js" />"></script>
</head>
<body>
	<div class="container-wrapper">
		<div class="container">
			<section>
				<div class="jumbotron">
					<div class="container">
						<h1>Cart</h1>						
					</div>
				</div>
			</section>
			<section class="container" ng-app="bookApp">
				<div ng-controller="mainController" ng-init="initCartId('${cartId}')">
					<a class="btn btn-danger" ng-click="clearCart()">
						<span class="glyphicon glyphicon-remove-sign">Clear cart</span>
					</a>
				<table class="table table-hover">
					<tr>
						<th>Product</th>
						<th>Unit price</th>
						<th>Quantity</th>
						<th>Price</th>
						<th>Action</th>
					</tr>
					<tr ng-repeat="item in cart.cartItems">
						<td>{{item.book.title}}</td>
						<td>{{item.book.price}}</td>
						<td>{{item.quantity}}</td>
						<td>{{item.totalPrice}}</td>
						<td><a href="#" class="label label-danger" ng-click="removeFromCart(item.book.isbn)"><span class="glyphicon glyphicon-remove">Remove</span></a></td>
					</tr>
					<tr>
						<th></th>
						<th></th>
						<th>Grand total</th>
						<th>{{calGrandTotal()}}</th>
						<th></th>
					</tr>
				</table>
				<a href="<c:url value='/books' />" class="btn btn-default">Continue shoping</a>
				</div>
			</section>
		</div>
	</div>

	<script type="text/javascript" src="<c:url value="/resources/js/lib/jquery-3.1.1.min.js" />"></script> 
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/bootstrap.min.js" />"></script> 
</body>
</html>