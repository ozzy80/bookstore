 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr" ng-app="myApp">
<head>
	<title>CSS Free Templates with jQuery Slider</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="<c:url value="css/images/favicon.ico" />" />
	<link rel="stylesheet" href="<c:url value="resources/css/bootstrap.min.css" />" type="text/css" />	
	<link rel="stylesheet" href="<c:url value="resources/css/style.css" />" type="text/css" media="all" />	
  	<script type="text/javascript" src="<c:url value="resources/js/lib/angular.min.js" />"></script> 
  	<script type="text/javascript" src="<c:url value="resources/js/app.js" />"></script>
</head>
<body>
	<!-- Header -->
	<div id="header" class="shell">
		<div id="logo"><h1><a href="#">BestSeller</a></h1></div>
		<!-- Navigation -->
		<div id="navigation">
			<ul>
				<li><a href="#" class="active">Home</a></li>
				<li><a href="#">Products</a></li>
				<li><a href="#">Promotions</a></li>
				<li><a href="#">Profile</a></li>
				<li><a href="#">About Us</a></li>
				<li><a href="#">Contacts</a></li>
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
					<p><a href="<c:url value="/customer/cart" />" class="cart" ><img src="resources/css/images/cart-icon.png" alt="" /></a>Shopping Cart (0) <a href="#" class="sum">$0.00</a></p>
				</div>			
			 </c:when>
			 <c:otherwise>
				<div id="login-details" ng-controller="mainController">
					<p><a href="<c:url value="/login" />">Login</a> | 
					   <a href="<c:url value="/register"/>">Register</a>
					</p>
					<p><a href="<c:url value="/customer/cart" />" class="cart" ><img src="resources/css/images/cart-icon.png" alt="" /></a>Shopping Cart (0) <a href="#" class="sum">$0.00</a></p>
				</div>					 
			 </c:otherwise>
		  </c:choose>
		<!-- End Login-details -->
		</div>
	<!-- End Header -->
	

		<div class="shell">
			<fieldset class="search-field">
			  <input class="search-input" type="text" id="name">
			  <label class="search-label" for="name">Pretrazi knjige</label>
			</fieldset>
			
		</div>
		
	
	
		<!-- Main -->
	<div id="main" class="shell row">
		<!-- Top ten -->
		<div id="top-ten-book-list" class="col-lg-3">
			<h4 id="top-ten-book-title">Knjige TOP 10</h4>
			<ul>
				<li class="top-ten-book row">
						<h3 class="col-lg-2">1</h3>
						<a href="#"><img src="resources/css/images/image01.jpg" alt=""  class="col-lg-6  "/></a>
						<div class="col-lg-4">
							<a href="#" class="book-name">NASLOV</a><br />
							<a href="#" class="author">AUTOR</a>
						</div>
				</li>
				<li class="top-ten-book row">
						<h3 class="col-lg-2">2</h3>
						<a href="#"><img src="resources/css/images/image02.jpg" alt=""  class="col-lg-6  "/></a>
						<div class="col-lg-4">
							<a href="#" class="book-name">NASLOV</a><br />
							<a href="#" class="author">AUTOR</a>
						</div>
				</li>
				<li class="top-ten-book row">
						<h3 class="col-lg-2">3</h3>
						<a href="#"><img src="resources/css/images/image03.jpg" alt=""  class="col-lg-6  "/></a>
						<div class="col-lg-4">
							<a href="#" class="book-name">NASLOV</a><br />
							<a href="#" class="author">AUTOR</a>
						</div>
				</li>
				<li class="top-ten-book row">
						<h3 class="col-lg-2">4</h3>
						<a href="#"><img src="resources/css/images/image04.jpg" alt=""  class="col-lg-6  "/></a>
						<div class="col-lg-4">
							<a href="#" class="book-name">NASLOV</a><br />
							<a href="#" class="author">AUTOR</a>
						</div>
				</li>
				<li class="top-ten-book row">
						<h3 class="col-lg-2">5</h3>
						<a href="#"><img src="resources/css/images/image05.jpg" alt=""  class="col-lg-6  "/></a>
						<div class="col-lg-4">
							<a href="#" class="book-name">NASLOV</a><br />
							<a href="#" class="author">AUTOR</a>
						</div>
				</li>
				<li class="top-ten-book row">
						<h3 class="col-lg-2">6</h3>
						<a href="#"><img src="resources/css/images/image06.jpg" alt=""  class="col-lg-6  "/></a>
						<div class="col-lg-4">
							<a href="#" class="book-name">NASLOV</a><br />
							<a href="#" class="author">AUTOR</a>
						</div>
				</li>
				<li class="top-ten-book row">
						<h3 class="col-lg-2">7</h3>
						<a href="#"><img src="resources/css/images/image07.jpg" alt=""  class="col-lg-6  "/></a>
						<div class="col-lg-4">
							<a href="#" class="book-name">NASLOV</a><br />
							<a href="#" class="author">AUTOR</a>
						</div>
				</li>
				<li class="top-ten-book row">
						<h3 class="col-lg-2">8</h3>
						<a href="#"><img src="resources/css/images/image08.jpg" alt=""  class="col-lg-6  "/></a>
						<div class="col-lg-4">
							<a href="#" class="book-name">NASLOV</a><br />
							<a href="#" class="author">AUTOR</a>
						</div>
				</li>
				<li class="top-ten-book row">
						<h3 class="col-lg-2">9</h3>
						<a href="#"><img src="resources/css/images/image01.jpg" alt=""  class="col-lg-6  "/></a>
						<div class="col-lg-4">
							<a href="#" class="book-name">NASLOV</a><br />
							<a href="#" class="author">AUTOR</a>
						</div>
				</li>
				<li class="top-ten-book row">
					<h3 class="col-lg-2">10</h3>
					<a href="#"><img src="resources/css/images/image02.jpg" alt=""  class="col-lg-6  "/></a>
					<div class="col-lg-4">
						<a href="#" class="book-name">NASLOV</a><br />
						<a href="#" class="author">AUTOR</a>
					</div>
				</li>								
			</ul>
		</div>
		<!-- End Top ten -->
		
		
		
		

		
		<!-- Content -->
		<div id="content" class="col-lg-6">
			<!-- Products -->
			<div class="products">
				<h3>Novi naslovi</h3>
				<ul class="row">
					<li class="col-lg-4">
						<div class="product new-title">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image01.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>
								</span>
							</a>
						</div>
					</li>
					<li class="col-lg-4">
						<div class="product">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image02.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>
								</span>
							</a>							
						</div>
					</li>
					<li class="col-lg-4">
						<div class="product">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image03.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>									
								</span>
							</a>							
						</div>
					</li>
					<li class="col-lg-4">
						<div class="product">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image04.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>									
								</span>
							</a>							
						</div>
					</li>
					<li class="col-lg-4">
						<div class="product">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image05.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>									
								</span>
							</a>							
						</div>
					</li>
					<li class="col-lg-4">
						<div class="product">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image06.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>									
								</span>
							</a>							
						</div>
					</li>
				</ul>
			<!-- End Products -->
			</div>
			
			
			
			
			
			
			<div class="cl">&nbsp;</div>
					<!-- Products -->
			<div class="products">
				<h3>Nagradjeni naslovi</h3>
				<ul class="row">
					<li class="col-lg-4">
						<div class="product new-title">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image01.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>									
								</span>
							</a>							
						</div>
					</li>
					<li class="col-lg-4">
						<div class="product">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image02.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>									
								</span>
							</a>							
						</div>
					</li>
					<li class="col-lg-4">
						<div class="product">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image03.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>									
								</span>
							</a>							
						</div>
					</li>
					<li class="col-lg-4">
						<div class="product">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image04.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>									
								</span>
							</a>							
						</div>
					</li>
					<li class="col-lg-4">
						<div class="product">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image05.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>									
								</span>
							</a>
						</div>
					</li>
					<li class="col-lg-4">
						<div class="product">
							<a href="#" class="info">
								<span class="holder">
									<img src="resources/css/images/image06.jpg" alt="" />
									<span class="book-name">Book Name</span>
									<span class="author">by John Smith</span>
									<span style="text-decoration: line-through;">Cena: 990.00 din</span><br/>
									<span>841.50 din</span>									
								</span>
							</a>
						</div>
					</li>
				</ul>
			<!-- End Products -->
		</div>
		<!-- End Content -->
		<div class="cl">&nbsp;</div>
	</div>
	<!-- End Main -->
	</div>
	
	
	
	
	
	<!-- Footer -->
	<div id="footer" class="shell">
		<div class="top">
			<div class="cnt row">
				<div class="col-lg-5">
					<h4>About BestSellers</h4>
					<p>Nulla porttitor pretium mattis. Mauris lorem massa, ultricies non mattis bibendum, semper ut erat. Morbi vulputate placerat ligula. Fusce <br />convallis, nisl a pellentesque viverra, ipsum leo sodales sapien, vitae egestas dolor nisl eu tortor. Etiam ut elit vitae nisl tempor tincidunt. Nunc sed elementum est. Phasellus sodales viverra mauris nec dictum. Fusce a leo libero. Cras accumsan enim nec massa semper eu hendrerit nisl faucibus. Sed lectus ligula, consequat eget bibendum eu, consequat nec nisl. In sed consequat elit. Praesent nec iaculis sapien. <br />Curabitur gravida pretium tincidunt.  </p>
				</div>
				<div class="store col-lg-3">
					<h4>Store</h4>
					<ul>
						<li><a href="#">Home</a></li>
						<li><a href="#">Special Offers</a></li>
						<li><a href="#">Log In</a></li>
						<li><a href="#">Account</a></li>
						<li><a href="#">Basket</a></li>
						<li><a href="#">Checkout</a></li>
					</ul>
				</div>
				<div class="col-lg-4" id="newsletter">
					<h4>Newsletter</h4>
					<p>Lorem ipsum dolor sit amet  consectetur. </p>
					<form action="" method="post">
						<input type="text" class="field" value="Your Name" title="Your Name" />
						<input type="text" class="field" value="Email" title="Email" />
						<div class="form-buttons"><input type="submit" value="Submit" class="submit-btn" /></div>
					</form>
				</div>
				<div class="cl">&nbsp;</div>
				<div class="copy">
					<p>&copy; <a href="#">BestSeller.com</a>. Design by <a href="http://css-free-templates.com/">CSS-FREE-TEMPLATES.COM</a></p>
				</div>
			</div>
		</div>
	</div>
	<!-- End Footer -->
	
	<script type="text/javascript" src="<c:url value="resources/js/lib/jquery-3.1.1.min.js" />"></script> 
  	<script type="text/javascript" src="<c:url value="resources/js/lib/bootstrap.min.js" />"></script> 
</body>
</html>