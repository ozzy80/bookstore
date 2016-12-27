<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="../resources/css/bootstrap.min.css" />" >
<script type="text/javascript" src="<c:url value="../resources/js/bootstrap.min.js" />"></script>

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
	           <th>popustu</th>
	           <th>Izdavac</th>
	           <th>Slika</th>
	        </tr>    
		</thead>
			<tr>
				<td>${book.isbn}</td>
				<td>${book.title}</td>
				<td>${book.booksInStock}</td>
				<td>${book.format}</td>
				<td>${book.numberOfPages}</td>
				<td>${book.publicationYear}</td>
				<td>${book.price}</td>
				<td>${book.discount}</td>
				<td>${book.publisher.name}</td>
				<td><img alt="slika" src=""></td>
			</tr>
	</table>
	<pre>${book.description}</pre>
</body>
</html>