<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" type="text/css" />	
	<link rel="stylesheet" href="<c:url value="/resources/css/style.css" />" type="text/css" media="all" />	
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular.min.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/lib/angular-resource.min.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/app.js" />"></script>
  	<script type="text/javascript" src="<c:url value="/resources/js/controller/cartController.js" />"></script>
<title>Login</title>
</head>
<body>
	<br/><br/>
	<div class="container-wrapper">
		<div class="container">
			<div >
				<div class="loginlinkovi">
					<a href="#" class="loginlinkpocetna">Vrati se na početnu</a>
					<a href="#" class="loginlinkpomoc">Pomoć</a>
				</div>
				<div id="loginlogo"><h1><a href="<c:url value="/" />">BeanBook</a></h1></div>
				<br/><br/><br/><br/>
				<h3>Prijava</h3>
				<div class="loginlinija"></div>
				
								
				<form class="loginforma" name="loginForm" action='<c:url value="/j_spring_security_check" />' method="post">
					<c:if test="${not empty error}">
						 <div class="alert alert-danger neispravniloginpodaci">
                			<a class="close " data-dismiss="alert" href="#"></a>Neispravno korisničko ime ili lozinka!
            			</div>
					</c:if>
					<div class="form-group">
						<label class="labelloginkorisnickoime" for="username">Korisničko ime:</label>
						<input type="text" id="username" name="username" class="form-control inputloginkorisnickoime" />
					</div>
					<br/><br/><br/>
					<div class="form-group">
						<label class="labelloginlozinka" for="password">Lozinka:</label>
						<input  type="password" id="password" name="password" class="form-control inputloginlozinka" />
					</div>
					<br/><br/>
					
					<input class="loginprijavadugme btn btn-warning" type="submit" value="Prijava" class="btn btn-warning">
					<br/><br/>
					<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
					<a href="#" class="loginlinkzaregistraciju">Registracija</a>
				</form>
				
			</div>
		</div>		
	</div>
</body>
</html>