<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value="../resources/css/bootstrap.min.css" />" >
<script type="text/javascript" src="<c:url value="../resources/js/lib/bootstrap.min.js" />"></script>

<title>Insert title here</title>
</head>
<body>
	<table class="table table-striped table-hover">
		<tr>
			<th>
				ID zanra
			</th>
			<th>
				Naziv
			</th>
		</tr>
		<tr>
			<td>
				${genre.genreID} 
			</td>
			<td>
				${genre.genreName}
			</td>
		</tr>
	</table>
	<a href='<c:out value="add" />' class="btn btn-primary">Add genre</a>
	
</body>
</html>