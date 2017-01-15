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
		
	<div class="container shell" style="height:480px;">
		<div class="row">
			<div class="col-xs-4"  >
				<div class="slikaAutora">
				<div class ="item">
					<img id="autorovaSlika" alt="slika" src='<c:url value="/resources/images/authors/${author.firstName}_${author.lastName}_${author.authorId}.jpg"  />'  >
					
				</div>
				</div>
			</div>
			<div class="col-xs-8" >
				<div class="podaciOAutoru">
					<span class = "imeAutora">${author.firstName} ${author.lastName} </span> <br/>
					<div class="linija"></div>
					<div class="opisAutora">
						${author.description}
					</div>
					
				</div>
			</div>
		</div>
		<div class="linija4"></div>
	</div>	
	
	
	<div class="container shell" style="height:300px;">
		<div class="naslovKnjigeAutora">Knjige</div>
		<div class="row">
			<div class="col-xs-4">
				<div class="prvaKnjigaAutora" >
					<img id="autorSlikaKnjige" alt="slika" src='<c:url value="/resources/images/Laguna/Tamo dole-9788652113972.jpg"  />'  >
					<div class="pojedinacnaKnjigaAutora" >
						<div class="naslovKnjige" >
							Tamo dole
						</div>
						<div class="linija"></div>
						<div class="opisJedneKnjigeAutora">
							 Bilo je to kao da sam privatno otkrio život na nekoj drugoj planeti, ili u paralelnom univerzumu gde je život momentalno prepoznatljiv, ali opet potpuno drugačiji. Ukoliko sam u prethodnim godinama uopšte i stekao nekakva očekivanja od Australije, ona mi je ličila na neku alternativnu južnu Kaliforniju. 
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-xs-4">
				<div class="prvaKnjigaAutora" >
					<img id="autorSlikaKnjige" alt="slika" src='<c:url value="/resources/images/Laguna/Tamo dole-9788652113972.jpg"  />'  >
					<div class="pojedinacnaKnjigaAutora" >
						<div class="naslovKnjige" >
							Tamo dole
						</div>
						<div class="linija"></div>
						<div class="opisJedneKnjigeAutora">
							 Bilo je to kao da sam privatno otkrio život na nekoj drugoj planeti, ili u paralelnom univerzumu gde je život momentalno prepoznatljiv, ali opet potpuno drugačiji. Ukoliko sam u prethodnim godinama uopšte i stekao nekakva očekivanja od Australije, ona mi je ličila na neku alternativnu južnu Kaliforniju. 
						</div>
					</div>
				</div>	
			</div>
			
			<div class="col-xs-4">
				<div class="prvaKnjigaAutora" >
					<img id="autorSlikaKnjige" alt="slika" src='<c:url value="/resources/images/Laguna/Tamo dole-9788652113972.jpg"  />'  >
					<div class="pojedinacnaKnjigaAutora" >
						<div class="naslovKnjige" >
							Tamo dole
						</div>
						<div class="linija"></div>
						<div class="opisJedneKnjigeAutora">
							 Bilo je to kao da sam privatno otkrio život na nekoj drugoj planeti, ili u paralelnom univerzumu gde je život momentalno prepoznatljiv, ali opet potpuno drugačiji. Ukoliko sam u prethodnim godinama uopšte i stekao nekakva očekivanja od Australije, ona mi je ličila na neku alternativnu južnu Kaliforniju. 
						</div>
					</div>
				</div>	
			</div>
			
		</div>
	
	</div>
		
	<div class="container shell" style="height:300px;">
		<div class="row">
			<div class="col-xs-4">
				<div class="prvaKnjigaAutora" >
					<img id="autorSlikaKnjige" alt="slika" src='<c:url value="/resources/images/Laguna/Tamo dole-9788652113972.jpg"  />'  >
					<div class="pojedinacnaKnjigaAutora" >
						<div class="naslovKnjige" >
							Tamo dole
						</div>
						<div class="linija"></div>
						<div class="opisJedneKnjigeAutora">
							 Bilo je to kao da sam privatno otkrio život na nekoj drugoj planeti, ili u paralelnom univerzumu gde je život momentalno prepoznatljiv, ali opet potpuno drugačiji. Ukoliko sam u prethodnim godinama uopšte i stekao nekakva očekivanja od Australije, ona mi je ličila na neku alternativnu južnu Kaliforniju. 
						</div>
					</div>
				</div>
			</div>
			
			<div class="col-xs-4">
				<div class="prvaKnjigaAutora" >
					<img id="autorSlikaKnjige" alt="slika" src='<c:url value="/resources/images/Laguna/Tamo dole-9788652113972.jpg"  />'  >
					<div class="pojedinacnaKnjigaAutora" >
						<div class="naslovKnjige" >
							Tamo dole
						</div>
						<div class="linija"></div>
						<div class="opisJedneKnjigeAutora">
							Autor bestselera Kratka istorija bezmalo svačega i Beleške s malog ostrva. Bilo je to kao da sam privatno otkrio život na nekoj drugoj planeti, ili u paralelnom univerzumu gde je život momentalno prepoznatljiv, ali opet potpuno drugačiji. Ne mogu ni da vam opišem koliko je to bilo uzbudljivo. Ukoliko sam u prethodnim godinama uopšte i stekao nekakva očekivanja od Australije, ona mi je ličila na neku alternativnu južnu Kaliforniju, mesto gde stalno sija sunce i ljudi veselo i isprazno provode život po plažama, ali sa donekle britanskim šmekom - kao neki Čuvari plaže s kriketom, kako sam tada mislio... Naravno, Bil Brajson nije video ništa nalik tome. Australija je zemlja koja obitava u ogromnim razmerama. Ona je šesta najveća država na svetu i ujedno njegovo najveće ostrvo. To je jedino ostrvo koje je istovremeno i kontinent, i jedini kontinent koji je istovremeno i država. To je najsuvlji, najvreliji, najbezvodniji, najjaloviji i klimatski najagresivniji od svih nastanjenih kontinenata, a opet vrvi životom - pri čemu su tamošnja živa bića uglavnom vrlo smrtonosna. Bil Brajson nije obraćao pažnju na sve te opasnosti - premda je opet bio neobično opsednut njima - kada je otputovao u Australiju i smesta se zaljubio u tu zemlju. A kako i ne bi? Ljudi su veseli, otvoreni, duhoviti i neizostavno uslužni; gradovi su im bezbedni, čisti i gotovo uvek podignuti pored vode; hrana je odlična; pivo je hladno, a sunce sija gotovo stalno. A šta čovek više da traži od života? Uživajte i vi u ovom urnebesno zabavnom i nesvakidašnjem putopisu.
		
						</div>
					</div>
				</div>	
			</div>
			
			<div class="col-xs-4">
				<div class="prvaKnjigaAutora" >
					<img id="autorSlikaKnjige" alt="slika" src='<c:url value="/resources/images/Laguna/Tamo dole-9788652113972.jpg"  />'  >
					<div class="pojedinacnaKnjigaAutora" >
						<div class="naslovKnjige" >
							Tamo dole
						</div>
						<div class="linija"></div>
						<div class="opisJedneKnjigeAutora">
							 Bilo je to kao da sam privatno otkrio život na nekoj drugoj planeti, ili u paralelnom univerzumu gde je život momentalno prepoznatljiv, ali opet potpuno drugačiji. Ukoliko sam u prethodnim godinama uopšte i stekao nekakva očekivanja od Australije, ona mi je ličila na neku alternativnu južnu Kaliforniju. 
						</div>
					</div>
				</div>	
			</div>
			
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