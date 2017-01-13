<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css" />" >
<script type="text/javascript" src="<c:url value="resources/js/bootstrap.min.js" />"></script>
<title>Svi izdavaci</title>
</head>
<body>
	<table class= "table table-striped table-hover">
		<thead>
			<th>
				ID izdavaca
			</th>
			<th>
				Naziv 
			</th>
			<th>
				Adresa
			</th>
			<th>
				Grad
			</th>
			<th>
				Drzava
			</th>
		</thead>
		<c:forEach items="${publishers}" var="publisher">
			<tr>
				<td>
					${publisher.id }
				</td>
				<td>
					${publisher.name}
				</td>
				<td>
					${publisher.adress }
				</td>
				<td>
					${publisher.city}
				</td>
				<td>
					${publisher.state}
				</td>
				<td>
					<a href='<c:out value="publishers/${publisher.id}" />'><span class="glyphicon glyphicon-info-sign"></span></a>
					<a href='<c:out value="publishers/del/${publisher.id}" />'><span class="glyphicon glyphicon-remove"></span></a>
					<a href='<c:out value="publishers/update/${publisher.id}" />'>Izmeni</a>
					
				</td>
			</tr>
		
		</c:forEach>
		
	
	</table>
	<a href='<c:out value="publishers/add" />' class="btn btn-primary">Add publisher</a>
</body>
</html>