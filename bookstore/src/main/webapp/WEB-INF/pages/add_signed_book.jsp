<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Dodavanje potpisane knjige</title>
</head>
<body>
	<form:form action="add" method="post" commandName="signedbook" enctype="multipart/form-data">
		<div class="form-group">
			<label for="isbn">ISBN</label>
			<form:input path="isbn" id="isbn" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="signedBooksNumber">Potpisanih primeraka</label>
			<form:input path="signedBooksNumber" id="signedBooksNumer" class="form-Controlor"/>
	</div>
	<input type="submit" value="submit" class="btn btn-default">
	</form:form>
</body>
</html>