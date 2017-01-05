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
				ISBN
			</th>
			<th>
				Broj potpisanih knjiga
			</th>
		</tr>
		<tr>
			<td>
				${signedBook.isbn} 
			</td>
			<td>
				${signedBook.signedBooksNumber}
			</td>
		</tr>
	</table>
	
</body>
</html>