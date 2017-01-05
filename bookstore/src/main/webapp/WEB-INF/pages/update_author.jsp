<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Promena autora</title>
</head>

<body>
	<form:form action="new" method="post" commandName="author" enctype="multipart/form-data">
		<div class="form-group">
			<label for="firstName">Ime</label>
			<form:input path="firstName" id="firstName" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="lastName">Prezime</label>
			<form:textarea path="lastName" id="lastName" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label for="description">Opis</label>
			<form:input path="description" id="description" class="form-Controlor"/>
		</div>
		<div class="form-group">
			<label class="control-label" for="authorImage">Upload picture</label>
			<form:input path="authorImage" id="authorImage" type="file" class="form:input-large"/>
		</div>
		<form:input type="hidden" path="authorId" value="${author.authorId}" />
		
		<input type="submit" value="submit" class="btn btn-default">
	</form:form>


</body>
</html>