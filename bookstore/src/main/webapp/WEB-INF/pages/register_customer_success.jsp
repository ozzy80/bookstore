<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
     
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" type="text/css" href="<c:url value="/resources/css/bootstrap.min.css" />" >
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular.min.js" />"></script> 
  	<script type="text/javascript" src="<c:url value="/resources/js/app.js" />"></script>
</head>
<body>
	<div class="container-wrapper">
		<div class="container">
			<section>
				<div class="jumbotron">
					<div class="container">
						<h1>Customer registered successfully</h1>						
					</div>
				</div>
			</section>
			<section class="container">
				<p>
					<a href="<c:url value='/books' />" class="btn btn-default">Books</a>
				</p>
			</section>
		</div>
	</div>

	<script type="text/javascript" src="<c:url value="/resources/js/lib/jquery-3.1.1.min.js" />"></script> 
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/bootstrap.min.js" />"></script> 
</body>
</html>