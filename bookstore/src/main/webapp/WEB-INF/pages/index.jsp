<%@include file="/WEB-INF/pages/template/header.jsp" %>

<!-- Main -->
<div id="main" class="shell row">
	
	<!-- Top ten -->
	<div id="top-ten-book-list" class="col-sm-3" ng-controller="topBookCotroller" ng-init="getTopBookList()">
		<h4 id="top-ten-book-title">Knjige TOP 10</h4>
		<ul ng-repeat="(i, book) in topBooks">
			<top-ten-book book-object="book" rank={{(i+1)}}></top-ten-book>
		</ul>
	</div>
	<!-- End Top ten -->
	
	<!-- Content -->
	<div id="content" class="col-lg-6" ng-controller="bookController">
		<!-- New Books -->
		<div class="products" ng-init="getNewBooks(desc, 0, 6)">
			<h3>Novi naslovi</h3>
			<ul class="row">
				<li class="col-sm-4" ng-repeat="book in newBooks">
					<book book-object = "book"></book>
				</li>
			</ul>
		<!-- End New Books -->
		</div>
		
		<!-- Awards Books -->
		<div class="products" ng-init="getBooksByGenre('Nagrađeni naslovi', 0, 12)">
			<h3>Nagradjeni naslovi</h3>
			<ul class="row">
				<li class="col-sm-4" ng-repeat="book in BooksByGenreList">
					<book book-object = "book"></book>
				</li>
			</ul>
		<!-- Awards Books -->
		</div>
	<!-- End Content -->
	<div class="cl">&nbsp;</div>
	</div>
</div>
<!-- End Main -->
	
<%@include file="/WEB-INF/pages/template/footer.jsp" %>	
