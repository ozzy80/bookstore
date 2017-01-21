<%@include file="/WEB-INF/pages/template/header.jsp" %>
  
	<div class="container shell" style="height:480px;padding-top:40px;padding-bottom:30px;">
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
	
	<div class="shell row margineKnjigeAutora" ng-controller="authorController">
		<!-- Knjige autora -->
			<div class="products" ng-init="getBooksByAuthor(${author.authorId})">
				<h3 style="margin-top:0px;display:inline-block;margin-bottom:20px;">Knjige autora</h3>
				<ul class="row">
					<li style="margin-right:20px;" class="pojedinacnaKnjigaAutora prvaKnjigaAutora col-sm-4" ng-repeat="book in bookList">
						<book book-object = "book"></book>
					</li>
				</ul>
			<!-- Knjige autora -->
			</div>
		<div class="cl">&nbsp;</div>
	</div>
<%@include file="/WEB-INF/pages/template/footer.jsp" %>  