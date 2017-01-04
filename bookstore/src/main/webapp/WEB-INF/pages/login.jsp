<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div class="container-wrapper">
		<div class="container">
			<div id="login-box">
				<h2>Login with username and password</h2>
				
				<c:if test="${not empty msg}">
					<div class="msg">${msg}</div>
				</c:if>
								
				<form name="loginForm" action='<c:url value="/j_spring_security_check" />' method="post">
					<c:if test="${not empty error}">
						<div class="error">${error}</div>
					</c:if>
					<div class="form-group">
						<label for="username">User</label>
						<input type="text" id="username" name="username" class="form-control" />
					</div>
					<div class="form-group">
						<label for="password">Password</label>
						<input type="password" id="password" name="password" class="form-control" />
					</div>
					<input type="submit" value="Submit" class="btn btn-default">
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				</form>
				
			</div>
		</div>		
	</div>
</body>
</html>