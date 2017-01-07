<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Dodavanje knjige</title>
</head>
<body>
	<form:form action="add" method="post" commandName="book" enctype="multipart/form-data">
		<div class="form-group">
			<label for="isbn">ISBN</label>
			<form:input path="isbn" id="isbn" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="title">Title</label>
			<form:input path="title" id="title" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="description">Description</label>
			<form:textarea path="description" id="description" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="stock">Books in stock</label>
			<form:input path="booksInStock" id="stock" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="format">Fromat</label>
			<form:input path="format" id="format" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="pages">Number of pages</label>
			<form:input path="numberOfPages" id="pages" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="year">Publication year</label>
			<form:input path="publicationYear" id="year" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="price">Price</label>
			<form:input path="price" id="price" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="discount">Discount</label>
			<form:input path="discount" id="discount" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label class="control-label" for="bookImage">Upload picture</label>
			<form:input path="bookImage" id="bookImage" type="file" class="form:input-large"/>
		</div>
		<input type="submit" value="submit" class="btn btn-default">
	</form:form>
</body>
</html>