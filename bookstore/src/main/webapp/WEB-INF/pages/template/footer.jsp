	<!-- Footer -->
	<div id="footer" class="shell">
		<div class="top">
			<div class="cnt">
				<div class="row">
					<div class="col-sm-5">
						<h4>O knjižari</h4>
						<p>Knjižara BookBean osnovana je aprila 1998. godine. Od skromnih početaka sa nekoliko objavljenih naslova za godinu dana došli smo do produkcije od preko tri stotine objavljenih naslova godišnje te sa pravom možemo reći da smo jedna od najvećih izdavačkih kuća ne samo u zemlji, već i u čitavom regionu.

				Za petnaest godina objavili smo veliki broj značajnih i uticajnih stranih i domaćih pisaca.

				<br/><br/>
 
				Standardi koje smo postavili na početku i od kojih nećemo odustajati jesu da naši čitaoci zaslužuju samo najbolje – kako u pogledu književnog kvaliteta, tako i kada je reč o opremi knjige. 
					</div>
					<div class="store col-sm-3">
						<h4>Store</h4>
						<ul>
							<li><a href="#">Naslovna</a></li>
							<li><a href="<c:url value="/login" />">Logovanje</a></li>
							<li><a href="#">Account</a></li>
							<li><a href="<c:url value="/customer/cart" />">Korpa</a></li>
							<li><a href="<c:url value="/j_spring_security_logout"/>">Checkout</a></li>
						</ul>
					</div>
					<div class="col-sm-4" id="newsletter">
						<h4>Novosti</h4>
						<p>Prijavite se ukoliko zelite da dobijate novosti. </p>
						<form action="" method="post">
							<input type="text" class="field" value="Ime" title="Your Name" />
							<input type="text" class="field" value="Email" title="Email" />
							<div class="form-buttons"><input type="submit" value="Submit" class="submit-btn" /></div>
						</form>
					</div>
				</div>
				<div class="cl">&nbsp;</div>
				<div class="copy">
					<p>&copy; <a href="#">BeanBook.com</a>. Design by <a href="#">Ozren and Ana</a></p>
				</div>
			</div>
		</div>
	</div>
	<!-- End Footer -->
	
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/bootstrap.min.js" />"></script> 
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/bootstrap-select.js" />"></script> 
  	<script type="text/javascript">
  		$(document).ready(function() {
  			$('#navigation a').removeClass('active');
			// get current URL path and assign 'active' class
			var pathname = window.location.pathname;
			$('#navigation > ul > li > a[href="'+pathname+'"]').addClass('active');
		})
  	</script>
</body>
</html>
