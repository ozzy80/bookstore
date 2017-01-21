<%@include file="/WEB-INF/pages/template/header.jsp" %>
		
		
	<div class="container shell" style="height:380px;padding-top:40px;">
		<div class="row">
			<div class="col-xs-2" >
				<div class="item" > 
					<img id="slika" alt="slika" src='<c:url value="/resources/images/${book.publisher.name}/${book.title}-${book.isbn}.jpg"  />'  >
					
				</div>
			</div>
			<div class="col-xs-6" >
				<div class="detaljiKnjige" >
					<div class="row-xs-3" ">
						<div class="podaciOKnjizi" >	
							<span class="naslovKnjige">${book.title}</span>
							<br/><br/>
							
							
							<c:forEach items="${book.authorList}" var="author">
								<span class="autorKnjige"><a class="autorKnjige" href="/bookstore/authors/${author.authorId}">${author.firstName} ${author.lastName} </a> </span>
							</c:forEach>
							<div class="linija"></div>
							<div class="detaljiKnjigeRazmaci">
								<span class="knjigaPojedinacniDetalji"><b>Izdavač: </b>${book.publisher.name}</span><br/>
								<span class="knjigaPojedinacniDetalji"><b>ISBN: </b> ${book.isbn}</span><br/>
								<span class="knjigaPojedinacniDetalji"><b>Broj strana: </b> ${book.numberOfPages}</span><br/>
								<span class="knjigaPojedinacniDetalji"><b>Pismo: </b> ${book.letter.letterType}</span><br/>
								<span class="knjigaPojedinacniDetalji"><b>Format: </b> ${book.format }</span> <br/>
								<span class=""><b>Datum izdanja: </b>${book.publicationYear}</span><br/>
								<div class="row">
								<div class="linija2"></div>
								
								<div class="col-sm-4"><b>Žanrovi: </b><br/></div><br/>
									
									<c:forEach items="${book.genreList}" var="genre">
										<span class="zanrKnjige" class="col-sm-8">${genre.genreName}</span><br/>
									</c:forEach>
								</div>
								
							</div>
						</div>
					</div>
					
				</div>
			</div>
			
			<div class="col-xs-4" ng-controller="mainController">
				<div class="knjigaDeoSaKorpom" >
					
					<span class="knjigaCena">Cena: 1220din</span><br/><br/>
					<span class="knjigaCena2">${book.price} din.</span><br/><br/>
					<a class="btn btn-warning" ng-click="addToCart(${book.isbn})">Dodaj u korpu</a>
					<input class="brojKomadaKnjige" type="number" name="quantity" value="1" min="1" max="9">komada
					<hr/>
					<span class="ostvarivanjePopusta" >
						Kupovinom tri ili više artikala ostvarujete i količinski popust od 10%. Za porudžbine iz Srbije čija vrednost je veća od 2000 dinara dostava je besplatna. Za knjige na akciji ne važe dodatni popusti.
					</span>
					
				</div>
			</div>	
		</div>		
		
	</div>	
			
			<div class="container shell" style="height:450px;">
				<div class="opisKnjige"><br/><br/>
					<span class="opisKnjige2"><b>Opis</b></span><br/>
					<div class="linija3"></div>
					<span class="opisStilTeksta">${book.description}</span>
				
				</div>
			</div>
		
		
<%@include file="/WEB-INF/pages/template/footer.jsp" %>  