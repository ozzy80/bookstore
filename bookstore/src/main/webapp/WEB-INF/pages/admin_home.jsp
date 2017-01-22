 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Admin Dashboard</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css" />" type="text/css" />  
    <link rel="stylesheet" href="<c:url value="/resources/css/metisMenu.min.css" />" type="text/css" />
    <link rel="stylesheet" href="<c:url value="/resources/css/timeline.css" />" type="text/css" />
  
    <link rel="stylesheet" href="<c:url value="/resources/css/startmin.css" />" type="text/css" />
    <!-- Morris Charts CSS -->
    <link rel="stylesheet" href="<c:url value="/resources/css/morris.css" />" type="text/css" />
    <!-- Custom Fonts -->
    <link rel="stylesheet" href="<c:url value="/resources/css/font-awesome.min.css" />" type="text/css" />
    <link rel="stylesheet" href="<c:url value="/resources/css/angular-ui-switch.min.css" />" type="text/css" />
    <link rel="stylesheet" href="<c:url value="/resources/css/admin-style.css" />" type="text/css" />

   <script type="text/javascript" src="<c:url value="https://code.angularjs.org/1.3.0-rc.1/angular.min.js" />"></script> 
   <script type="text/javascript" src="<c:url value="https://code.angularjs.org/1.3.0-rc.1/angular-route.min.js" />"></script>
   <script type="text/javascript" src="<c:url value="https://code.angularjs.org/1.3.0-rc.1/angular-resource.min.js" />"></script> 

   <script src="https://cdnjs.cloudflare.com/ajax/libs/underscore.js/1.8.3/underscore-min.js"></script>

   <script type="text/javascript" src="<c:url value="/resources/js/adminApp.js" />"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/adminService.js" />"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/controller/admin/dashboardController.js" />"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/controller/admin/bookController.js" />"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/controller/admin/authorController.js" />"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/controller/admin/publisherController.js" />"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/controller/admin/genreController.js" />"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/controller/admin/letterController.js" />"></script>
   <script type="text/javascript" src="<c:url value="/resources/js/controller/admin/userController.js" />"></script>

<script type="text/javascript" src="<c:url value="/resources/js/lib/ng-file-upload-shim.min.js" />"></script>
<script type="text/javascript" src="<c:url value="/resources/js/lib/ng-file-upload.min.js" />"></script>



   
</head>
<body ng-app="adminApp">

<div id="wrapper">
    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="navbar-header">
            <a class="navbar-brand" href="<c:url value="/" />">BeanBook</a>
        </div>

        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>

        <!-- Top Navigation: Left Menu -->
        <ul class="nav navbar-nav navbar-left navbar-top-links">
            <li><a href="<c:url value="/" />"><i class="fa fa-home fa-fw"></i> Website</a></li>
        </ul>

        <!-- Top Navigation: Right Menu -->
        <ul class="nav navbar-right navbar-top-links">
            <li class="dropdown navbar-inverse">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-bell fa-fw"></i> <b class="caret"></b>
                </a>
                <ul class="dropdown-menu dropdown-alerts">
                    <li>
                        <a href="#">
                            <div>
                                <i class="fa fa-comment fa-fw"></i> Novi komentari
                                <span class="pull-right text-muted small"> pre 4 minuta</span>
                            </div>
                        </a>
                    </li>
                    <li class="divider"></li>
                    <li>
                        <a class="text-center" href="#">
                            <strong>Vidi Sve Somentare</strong>
                            <i class="fa fa-angle-right"></i>
                        </a>
                    </li>
                </ul>
            </li>
            <li class="dropdown">
                <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                    <i class="fa fa-user fa-fw"></i> <c:out value="${pageContext.request.userPrincipal.name}" /> <b class="caret"></b>
                </a>
                <ul class="dropdown-menu dropdown-user">
                    <li><a href="#"><i class="fa fa-user fa-fw"></i> Korisnički Profil</a>
                    </li>
                    <li><a href="#"><i class="fa fa-gear fa-fw"></i> Podešavanja</a>
                    </li>
                    <li class="divider"></li>
                    <li><a href="<c:url value="/j_spring_security_logout"/>"><i class="fa fa-sign-out fa-fw"></i> Odjavi se</a>
                    </li>
                </ul>
            </li>
        </ul>

        <!-- Sidebar -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse">
                <ul class="nav" id="side-menu">
                    <li class="sidebar-search">
                        <div class="input-group custom-search-form">
                            <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button class="btn btn-primary" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                        </div>
                    </li>
                    <li>
                        <a href="#/" class="active"><i class="fa fa-dashboard fa-fw"></i> Komandna tabla</a>
                    </li>
                    <li>
                        <a href="#/knjige" class="active"><i class="fa fa-book fa-fw"></i> Knjige</a>
                    </li>
                    <li>
                        <a href="#/autori" class="active"><span class="glyphicon glyphicon-user" /> Autori</a>
                    </li>
                    <li>
                        <a href="#"><i class="fa fa-wrench"></i> Ostala podešavanja<span class="fa arrow"></span></a>
                        <ul class="nav nav-second-level">
                            <li>
                                <a href="#izdavaci">Izdavači</a>
                            </li>
                            <li>
                                <a href="#zanrovi">Žanrovi</a>
                            </li>
                            <li>
                                <a href="#pisma">Pisma</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="#korisnici" class="active"><i class="fa fa-users fa-fw"></i> Korisnici</a>
                    </li>
                </ul>

            </div>
        </div>
    </nav>

    <!-- Page Content -->
    <div id="page-wrapper">
        <div class="container-fluid">

        <div class="customContainer">

            <div ng-view></div>
            
        </div>

        </div>
    </div>

</div>


         
            <input id="toggle-demo" type="checkbox" data-toggle="toggle">
         




















<!-- jQuery -->
<script type="text/javascript" src="<c:url value="/resources/js/lib/jquery-3.1.1.min.js" />"></script> 

<!-- Bootstrap Core JavaScript -->
<script type="text/javascript" src="<c:url value="/resources/js/lib/bootstrap.min.js" />"></script> 

<!-- Metis Menu Plugin JavaScript -->
<script type="text/javascript" src="<c:url value="/resources/js/lib/metisMenu.min.js" />"></script> 

<!-- Custom Theme JavaScript -->
<script type="text/javascript" src="<c:url value="/resources/js/lib/startmin.js" />"></script> 

<script type="text/javascript" src="<c:url value="/resources/js/lib/dirPagination.js" />"></script> 

<script type="text/javascript" src="<c:url value="/resources/js/lib/angular-ui-switch.min.js" />"></script> 

<script src="https://cdnjs.cloudflare.com/ajax/libs/highlight.js/8.3/highlight.min.js"></script>

</body>
</html>
