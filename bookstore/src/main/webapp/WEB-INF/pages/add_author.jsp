<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Dodavanje autora</title>
</head>
<body>
	<form:form action="add" method="post" commandName="author" enctype="multipart/form-data">
		<div class="form-group">
			<label for="ime_autora">Ime: </label>
			<form:input path="firstName" id="ime_autora" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="prezime_autora">Prezime: </label>
			<form:input path="lastName" id="prezime_autora" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="opis_autora">Opis: </label>
			<form:textarea path="description" id="opis_autora" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label class="control-label" for="authorImage">Upload picture</label>
			<form:input path="authorImage" id="authorImage" type="file" class="form:input-large"/>
		</div>
		<input type="submit" value="submit" class="btn btn-default">
	</form:form>
</body>
</html>