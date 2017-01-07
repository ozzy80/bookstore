<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Promena pisma</title>
</head>
<body>
	<c:url var="post_url"  value="/publishers/update" />
	<form:form action='${post_url}' method="post" commandName="publisher">
		<div class="form-group">
			<label for="name">Naziv: </label>
			<form:input path="name" id="name" class="form-Controlor" value="${publisher.name}"/> 
		</div>
		<div class="form-group">
			<label for="adress">Naziv: </label>
			<form:input path="adress" id="adress" class="form-Controlor" value="${publisher.adress}"/> 
		</div>
		<div class="form-group">
			<label for="city">Grad: </label>
			<form:input path="city" id="city" class="form-Controlor" value="${publisher.city}"/> 
		</div>
		<div class="form-group">
			<label for="state">Drzava: </label>
			<form:input path="state" id="state" class="form-Controlor" value="${publisher.state}"/> 
		</div>
		
		
		<form:input type="hidden" path="id" value="${publisher.id}" />
		<input type="submit" value="submit" class="btn btn-default" />
	</form:form>

</body>
</body>
</html>