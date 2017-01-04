<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="resources/css/bootstrap.min.css" />" >
<script type="text/javascript" src="<c:url value="resources/js/lib/bootstrap.min.js" />"></script>

<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped table-hover">
		<thead>
	        <tr>
	           <th>ISBN</th>
	           <th>Naziv</th>
	           <th>Dostupno</th>
	           <th>Format</th>
	           <th>Strana</th>
	           <th>Godina izdanja</th>
	           <th>Cena</th>
	           <th>Izdavac</th>
	           <th>Slika</th>
	           <th>Info</th>
	           <th>Autori</th>
	        </tr>    
		</thead>
		<c:forEach items="${books}" var="book">
			<tr>
				<td>${book.isbn}</td>
				<td>${book.title}</td>
				<td>${book.booksInStock}</td>
				<td>${book.format}</td>
				<td>${book.numberOfPages}</td>
				<td>${book.publicationYear}</td>
				<td>${book.price}</td>
				<td>${book.publisher.name}</td>
				<td><img alt="slika" src='<c:url value="resources/images/${book.publisher.name}/${book.title}-${book.isbn}.jpg" />'></td>
				<td>
					<a href='<c:out value="books/${book.isbn}" />'><span class="glyphicon glyphicon-info-sign"></span></a>
					<a href='<c:out value="books/del/${book.isbn}" />'><span class="glyphicon glyphicon-remove"></span></a>	
				</td>
				<td>
					<ol>
						<c:forEach items="${book.authorList}" var="author">
							<li>${author.firstName} ${author.lastName}</li>
						</c:forEach>
					</ol>
				</td>
			</tr>
		</c:forEach>
	</table>
	<a href='<c:out value="books/add" />' class="btn btn-primary">Add book</a>
</body>
</html>