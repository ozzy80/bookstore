 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr" ng-app="bookApp">
<head>
	<title>BeanBook</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="<c:url value="/resources/css/images/favicon.ico" />" />
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" type="text/css" />	
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap-select.min.css" />" type="text/css" />
	<link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css" />" type="text/css" />		
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="all" />
	<script type="text/javascript" src="<c:url value="/resources/js/lib/jquery-3.1.1.min.js" />"></script> 	
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular.min.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular-resource.min.js" />"></script> 

  	<script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/dirPagination.js" />"></script> 
  	
  	<script type="text/javascript" src="<c:url value="/resources/js/app.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/service.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/cartController.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/topBookController.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/bookController.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/genreController.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/optionsController.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/authorController.js" />"></script>
  	
</head>
<body>
	<!-- Header -->
	<div id="header" class="shell">
		<div id="logo"><h1><a href="<c:url value="/" />">BeanBook</a></h1></div>
		<!-- Navigation -->
		<div id="navigation">
			<ul>
				<li><a href="<c:url value="/" />" class="active">Naslovna</a></li>
				<li><a href="<c:url value="/booklist" />">Knjige</a></li>
				<li><a href="<c:url value="/o_nama" />">O nama</a></li>
				<li><a href="<c:url value="/kontakt" />">Kontakt</a></li>
				<li><a href="<c:url value="/pomoc" />">Pomoć</a></li>
				<sec:authorize access="hasRole('ROLE_ADMIN')">
					<li><a href="<c:url value="/admin/" />">Admin</a></li>
				</sec:authorize>
			</ul>
		</div>
		<!-- End Navigation -->
		<div class="cl">&nbsp;</div>
		<!-- Login-details -->
		  <c:choose>
			 <c:when test="${not empty pageContext.request.userPrincipal}">
				<div id="login-details" ng-controller="mainController">
					<p>Welcome, 
						<a href="#" id="user"><c:out value="${pageContext.request.userPrincipal.name}" /></a> | 
						<a href="<c:url value="/j_spring_security_logout"/>">Log out</a>
					</p>
					<p><a href="<c:url value="/customer/cart" />" class="cart" ><img src="/bookstore/resources/css/images/cart-icon.png" alt="" /></a>Shopping Cart (0) <a href="#" class="sum">$0.00</a></p>
				</div>			
			 </c:when>
			 <c:otherwise>
				<div id="login-details" ng-controller="mainController">
					<p><a href="<c:url value="/login" />">Logovanje</a> | 
					   <a href="<c:url value="/register"/>">Registracija</a>
					</p>
					<p><a href="<c:url value="/customer/cart" />" class="cart" ><img src="/bookstore/resources/css/images/cart-icon.png" alt="" /></a>Shopping Cart (0) <a href="#" class="sum">$0.00</a></p>
				</div>					 
			 </c:otherwise>
		  </c:choose>
		<!-- End Login-details -->
		</div>
	<!-- End Header -->
	
	<!-- Search -->
		<div class="shell" ng-controller="bookController">
				<div class="row">
					<div class="col-md-12">
			            <div class="input-group" id="adv-search">
			                <input type="text" class="form-control pretragaKnjigeAutora" placeholder="Pretrazi knjige" ng-model="bookSearch"
			                	ng-keyup="autocomplete(bookSearch)"/>
	  		 	          		<ul class="list-group" ng-model="hidethis" ng-hide="hidethis">  
		                        <li class="list-group-item"  
										dir-paginate="book in ACBooks|itemsPerPage: 10"
		                        ng-click="fillTextbox(book.title, book.isbn)">{{book.title}}</li>
		                        <dir-pagination-controls
									       max-size="5"
									       direction-links="true"
									       boundary-links="true" >
									    </dir-pagination-controls>  
	 				            </ul>  
			                <div class="input-group-btn">
			                    <div class="btn-group" role="group">
			                        <button type="button" class="btn btn-primary" ng-click="goToBook()"><span class="glyphicon glyphicon-search" aria-hidden="true"></span></button>
			                    </div>
			                </div>
			            </div>
			          </div>
			        </div>
				</div>
		<!-- End Search -->
	
