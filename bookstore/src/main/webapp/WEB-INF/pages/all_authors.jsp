<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css" />" >
<script type="text/javascript" src="<c:url value="resources/js/bootstrap.min.js" />"></script>
<title>Insert title here</title>
</head>
<body>
	<table class = "table table-striped table-hover">
		<thead>
			<th>
				ID autora
			</th>
			<th>
				Ime
			</th>
			<th>
				Prezime
			</th>
			<th>
				Opis
			</th>
		</thead>
		<c:forEach items="${authors}" var="author">
			<tr>
				<td>
					${author.authorId}
				</td>
				<td>
					${author.firstName}
				</td>
				<td>
					${author.lastName}
				</td>
				<td>
					${author.description}
				</td>
				<td>
					<a href='<c:out value="${author.authorId}" />'><span class="glyphicon glyphicon-info-sign"></span></a>
					<a href='<c:out value="del/${author.authorId}" />'><span class="glyphicon glyphicon-remove"></span></a>
					<a href='<c:out value="authors/update/${author.authorId}" />'>Izmeni</a>
	
				</td>
			</tr>
		
		</c:forEach>
	</table>	
	<a href='<c:out value="authors/add" />' class="btn btn-primary">Add author</a>
	
</body>
