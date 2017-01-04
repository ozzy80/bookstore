<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Dodavanje zanra</title>
</head>
<body>
	<form:form action="add/new" method="post" commandName="genre" enctype="multipart/form-data">
		<div class="form-group">
			<label for="naziv">Naziv: </label>
			<form:input path="genreName" id="naziv" class="form-Controlor"/>
		</div>
	
		<input type="submit" value="submit" class="btn btn-default">
	</form:form>
	
</body>
</html>