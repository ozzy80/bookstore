 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
 
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html lang="en-US" xmlns="http://www.w3.org/1999/xhtml" dir="ltr" >
<head>
	<title>CSS Free Templates with jQuery Slider</title>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
	<link rel="shortcut icon" href="<c:url value="/css/images/favicon.ico" />" />
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" type="text/css" />	
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="all" />	
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular.min.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular-resource.min.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/app.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/cartController.js" />"></script>
</head>
<body>
	<!-- Header -->
	<div id="header" class="shell"  style="height:150px;">
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
	</div>
	<!-- End Header -->
		
		
	<div class="container shell" style="height:380px;spacing:5px;">
		<div class="row">
			<div class="col-xs-2" >
				<div class="customDiv1 item" > 
					<!-- <img alt="slika" src='<c:url value="/resources/images/authors/${author.firstName}_${author.lastName}_${author.authorId}.jpg" />'>	-->
					<img id="slika" alt="slika" src='<c:url value="/resources/css/images/cvetic.jpg"  />'  >
					
				</div>
			</div>
			<div class="col-xs-6" >
				<div class="customDiv2" >
					<div class="row-xs-3" ">
						<div class="customDiv4" >	
							<span style="font-size:22px;text-style:italic;font-weight:bold;text-transform:uppercase;text-align:left;font-size:20px;color:#0182b5;">${book.title}</span>
							<br/><br/>
							
							<c:forEach items="${book.authorList}" var="author">
								<span style="font-size:19px;padding-bottom:1cm">${author.firstName} ${author.lastName}  </span>
							</c:forEach>
							<hr/>
							<div style="font-size:14px;">
								<span style="display:inline-block;padding-bottom:3px;"><b>Izdavac: </b>${book.publisher.name}</span><br/>
								<span style="display:inline-block;padding-bottom:3px;"><b>ISBN: </b> ${book.isbn}</span><br/>
								<span style="display:inline-block;padding-bottom:3px;"><b>Broj strana: </b> ${book.numberOfPages}</span><br/>
								<span style="display:inline-block;padding-bottom:3px;"><b>Pismo: </b> ${book.letter.letterType}</span><br/>
								<span style="display:inline-block;padding-bottom:3px;"><b>Format: </b> ${book.format }</span> <br/>
								<span style="display:inline-block;padding-bottom:3px;"><b>Datum izdanja: </b>${book.publicationYear}</span><br/>
								<div class="row">
								<hr/>
								<div class="col-sm-4"><b>Zanrovi: </b><br/></div><br/>
									
									<c:forEach items="${book.genreList}" var="genre">
										<span style="padding-left:1cm" class="col-sm-8">${genre.genreName}</span><br/>
									</c:forEach>
								</div>
								
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="col-xs-4" >
				<div class="customDiv3" style="padding-top:30px;text-align:center;border: rgba(20, 10, 12, 0.69);background-color:rgba(192,192,192,0.2);-moz-box-shadow: 12px 10px 23px #000000;-webkit-box-shadow: 12px 10px 23px #c0c0c0;box-shadow: 12px 10px 23px #c0c0c0;">
					
					<span style="text-decoration:line-through;font-size:20px;text-style:">Cena: 1220din</span><br/><br/>
					<span style="font-size:22px;color:#0182b5;">${book.price} din.</span><br/><br/><br/>
					<button type="button" class="btn btn-warning">Dodaj u korpu</button>
					<input style="margin-left:-2px;width:30px;" type="number" name="quantity" value="1" min="1" max="5">komada
					<hr/>
					<span style="display:inline-block;padding:10px;" >
						Kupovinom tri ili više artikala ostvarujete i količinski popust od 10%. Za porudžbine iz Srbije čija vrednost je veća od 2000 dinara dostava je besplatna. Za knjige na akciji ne važe dodatni popusti.
					</span>
					
				</div>
			</div>	
		</div>		
		
	</div>	
		
			<div class="container shell" style="height:400px;">
				<div class="opisDiv">
					<span style="display:inline-block;"><b>Opis</b></span><br/>
					<hr/>
					${book.description}
				
				</div>
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
	
	<script type="text/javascript" src="<c:url value="/resources/js/lib/jquery-3.1.1.min.js" />"></script> 
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/bootstrap.min.js" />"></script> 
</body>
</html>