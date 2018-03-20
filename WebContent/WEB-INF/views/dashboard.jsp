<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Student Dashboard</title>
<script src="https://www.gstatic.com/firebasejs/4.8.1/firebase.js"></script>
<script src="resources/js/config.js"></script>
<!-- Bootstrap core CSS-->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">
<link href="resources/css/dashboard.css" rel="stylesheet">
<!-- Custom styles for this template-->
<link href="resources/css/sb-admin.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" />
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script defer
	src="https://use.fontawesome.com/releases/v5.0.8/js/all.js"></script>
</head>
<body class="fixed-nav sticky-footer bg-dark" id="page-top">


	<!-- Navigation-->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top"
		id="mainNav">
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav navbar-sidenav" id="exampleAccordion">
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Personal Info"><a class="nav-link" href="#"> <i
						class="far fa-address-card"></i> <span class="nav-link-text">Personal Info</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Drives"><a class="nav-link" href="#"> <i
						class="far fa-calendar-alt"></i> <span class="nav-link-text">My Drives <br> (Feature coming soon!)</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Driving Log"><a class="nav-link" href="#"> <i
						class="far fa-list-alt"></i> <span class="nav-link-text">Driving Log<br> (Feature coming soon!)</span>
				</a></li>
				<li class="nav-item" data-toggle="tooltip" data-placement="right"
					title="Message"><a class="nav-link" href="#"> <i
						class="far fa-envelope"></i> <span class="nav-link-text">Contact Us <br> (Feature coming soon!)</span>
				</a></li>
			</ul>
			<ul class="navbar-nav sidenav-toggler">
				<li class="nav-item"><a class="nav-link text-center"
					id="sidenavToggler"> <i class="fa fa-fw fa-angle-left"></i>
				</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">
				<li class="nav-item"><a class="nav-link" data-toggle="modal"
					data-target="#exampleModal"> <i class="fas fa-sign-out-alt"></i>Logout
				</a></li>
			</ul>
		</div>
	</nav>
	<div class="content-wrapper">
		<div class="container-fluid">
			<!-- Breadcrumbs-->
			<ol class="breadcrumb">
				<li class="breadcrumb-item"><a href="#">Dashboard</a></li>
				<li class="breadcrumb-item active">Charts</li>
			</ol>
			<!-- Area Chart Example-->
			<div class="card mb-3">
				<div class="card-header">
					<i class="fa fa-area-chart"></i> Area Chart Example
				</div>
				<div class="card-body">
					<canvas id="myAreaChart" width="100%" height="30"></canvas>
				</div>
				<div class="card-footer small text-muted">Updated yesterday at
					11:59 PM</div>
			</div>
			<div class="row">
				<div class="col-lg-8">
					<!-- Example Bar Chart Card-->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-bar-chart"></i> Bar Chart Example
						</div>
						<div class="card-body">
							<canvas id="myBarChart" width="100" height="50"></canvas>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
				<div class="col-lg-4">
					<!-- Example Pie Chart Card-->
					<div class="card mb-3">
						<div class="card-header">
							<i class="fa fa-pie-chart"></i> Pie Chart Example
						</div>
						<div class="card-body">
							<canvas id="myPieChart" width="100%" height="100"></canvas>
						</div>
						<div class="card-footer small text-muted">Updated yesterday
							at 11:59 PM</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.container-fluid-->
		<!-- /.content-wrapper-->
		<footer class="sticky-footer">
			<div class="container">
				<div class="text-center">
					<small>Copyright © Polyservice 2018</small>
				</div>
			</div>
		</footer>
		<!-- Scroll to Top Button-->
		<a class="scroll-to-top rounded" href="#page-top"> <i
			class="fa fa-angle-up"></i>
		</a>
		<!-- Logout Modal-->
		<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
			aria-labelledby="exampleModalLabel" aria-hidden="true">
			<div class="modal-dialog" role="document">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title" id="exampleModalLabel">Ready to
							Leave?</h5>
						<button class="close" type="button" data-dismiss="modal"
							aria-label="Close">
							<span aria-hidden="true">×</span>
						</button>
					</div>
					<div class="modal-body">Select "Logout" below if you are
						sure you want to logout.</div>
					<div class="modal-footer">
						<button class="btn btn-secondary" type="button"
							data-dismiss="modal">Cancel</button>
						<a class="btn btn-primary" href="home">Logout</a>
					</div>
				</div>
			</div>
		</div>

		<script src="resources/js/dashboard.js"></script>
		<!-- Bootstrap core JavaScript-->
		<script src="resources/js/jquery.min.js"></script>
		<!-- Core plugin JavaScript-->
		<script src="resources/js/jquery.easing.min.js"></script>
		<script src="resources/js/bootstrap.bundle.min.js"></script>
		<!-- Custom scripts for all pages-->
		<script src="resources/js/sb-admin.min.js"></script>
	</div>
</body>


</html>

