<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="resources/css/bootstrap.min.css" />" >
<script type="text/javascript" src="<c:url value="resources/js/bootstrap.min.js" />"></script>
<title>Dodavanje izdavaca</title>
</head>
<body>
	<form:form action="add/new" method="post" commandName="publisher" enctype="multipart/form-data">
		<div class="form-group">
			<label for="name">Naziv: </label>
			<form:input path="name" id="name" class="form-Controlor"/>
		</div>
	
		<div class="form-group">
			<label for="adress">Adresa: </label>
			<form:input path="adress" id="adress" class="form-Controlor"/>
		</div>
		
		<div class="form-group">
			<label for="city">Grad: </label>
			<form:input path="city" id="city" class="form-Controlor"/>
		</div>
	
		<div class="form-group">
			<label for="state">Drzava: </label>
			<form:input path="state" id="state" class="form-Controlor"/>
		</div>
		
		<input type="submit" value="submit" class="btn btn-default">
	</form:form>
		
</body>
</html>