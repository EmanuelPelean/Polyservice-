<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Polyservice Schedule</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/modern-business.css" rel="stylesheet">

<script src="https://www.gstatic.com/firebasejs/4.8.1/firebase.js"></script>
<link href="resources/css/schedule.css" type="text/css" rel="stylesheet">
<link
	href="http://fonts.googleapis.com/css?
		family=Reenie+Beanie:regular"
	rel="stylesheet" type="text/css">
</head>
<body>

	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="home">Polyservice Driving School</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="#">About</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Location</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	
	<!-- Page Content -->
	<div class="container">

		<!-- Page Heading/Breadcrumbs -->
		<h1 class="mt-4 mb-3">
			Academic Calendar
		</h1>

		<ol class="breadcrumb">
			<li class="breadcrumb-item active"><b>Segment 1 Courses</b> (Click on a course to zoom in.)</li>
		</ol>

	</div>
	<!-- /.container -->

	<ul id="list" class="ul-custom">

	</ul>
	
	<!-- Page Content -->
	<div class="container">

		<ol class="breadcrumb">
			<li class="breadcrumb-item active"><b>Segment 2 Courses</b> (Click on a course to zoom in.)</li>
		</ol>

	</div>
	<!-- /.container -->
	
	
	<ul id="list2" class="ul-custom">

	</ul>

	<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy; Polyservice Inc. 2018</p>
		</div>
		<!-- /.container -->
	</footer>




	<script src="resources/js/config.js"></script>
	<script src="resources/js/schedule.js"></script>
</body>
</html>