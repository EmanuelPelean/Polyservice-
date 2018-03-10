<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="Polyservice Driving School">
<meta name="author" content="Emanuel Pelean">

<title>Home</title>

<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<link href="resources/css/animate.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/modern-business.css" rel="stylesheet">

<script src="https://www.gstatic.com/firebasejs/4.8.1/firebase.js"></script>
<script src="resources/js/config.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">

<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=${google_key}&callback=initMap">
	
</script>
<script src="https://code.jquery.com/jquery-3.1.1.slim.min.js"
	integrity="sha384-A7FZj7v+d/sdmMqp/nOQwliLvUsJfDHW+k9Omg/a/EheAdgtzNs3hpfag6Ed950n"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/tether/1.4.0/js/tether.min.js"
	integrity="sha384-DztdAPBWPRXSA/3eYEEUWrWCy7G5KFbe8fFjk5JAIxUYHKkDx6Qin1DkWx51bBrb"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/js/bootstrap.min.js"
	integrity="sha384-vBWWzlZJ8ea9aCX4pEW3rVHjgjt7zpkNpZk+02D9phzyeVkE+jo0ieGizqPLForn"
	crossorigin="anonymous"></script>


</head>
<body>

	<!-- Navigation -->
	<nav
		class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
		<div class="container">
			<a class="navbar-brand" href="#"> <img
				src="resources/img/logo.png" width="80" height="80" alt="">
			</a> <a class="navbar-brand" href="home">Polyservice Driving School</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link" href="#">About</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Services</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Location</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Contact</a>
					</li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdownBlog"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Other Pages </a>
						<div class="dropdown-menu dropdown-menu-right"
							aria-labelledby="navbarDropdownBlog">
							<a class="dropdown-item" href="ajax">Ajax Page</a> <a
								class="dropdown-item" href="registration">Registration Page</a>
							<a class="dropdown-item" href="schedule">Schedule</a> <a
								class="dropdown-item" href="dashboard">Dashboard Page</a> <a
								class="dropdown-item" href="adminconsole">Admin Console Page</a>
							<a class="dropdown-item"
								href="https://accounts.google.com/o/oauth2/v2/auth?client_id=550605181054-gaaodk6ms9ce6inelma166gh03s8crhf.apps.googleusercontent.com&response_type=code&scope=openid%20email&redirect_uri=http://localhost:8080/Polyservice/result&state=${state }&login_hint=jsmith@example.com&nonce=0394852-3190485-2490358">Login
								Test</a>
						</div></li>
					<li id="loginLi" class="nav-item dropdown"><a href="#"
						class="nav-link dropdown-toggle" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false">Log In <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu dropdown-menu-right dropdown-lr"
							role="menu">
							<div class="col-lg-12">
								<div class="text-center">
									<h3>
										<b>Log In</b>
									</h3>
								</div>
								<form id="ajax-login-form" action="#" role="form"
									autocomplete="off">
									<div class="form-group">
										<label for="username">Username:</label> <input type="text"
											name="username" id="username" tabindex="1"
											class="form-control" value="" autocomplete="on">
									</div>

									<div class="form-group">
										<label for="password">Password:</label> <input type="password"
											name="password" id="password" tabindex="2"
											class="form-control" autocomplete="off">
									</div>

									<div class="form-group">
										<div class="row ">
											<div class="col-lg-12">
												<div class="text-center">
													<button id="btnLogin" type="button"
														class="btn btn-primary btn-md">Sign In</button>
												</div>
											</div>
										</div>
									</div>

									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="#" class="forgot-password">Forgot Password?</a>
												</div>
											</div>
										</div>
									</div>

									<hr>

									<div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<h6>First time user?</h6>
													<a id="btnSignUp" href="registration"
														class="forgot-password">Click here to register!</a>
												</div>
											</div>
										</div>
									</div>

								</form>
							</div>
						</ul></li>
					<li id="logoutLi" class="nav-item"><a class="nav-link"
						id="btnLogout" href="#">Log Out</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<header>
		<div id="carouselExampleIndicators" class="carousel slide"
			data-ride="carousel">
			<ol class="carousel-indicators">
				<li data-target="#carouselExampleIndicators" data-slide-to="0"
					class="active"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
				<li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			<div class="carousel-inner" role="listbox">
				<!-- Slide One - Set the background image for this slide in the line below -->
				<div class="carousel-item active"
					style="background-image: url('http://placehold.it/1900x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3>CDL A Training</h3>
						<p>Begin your career as a commercial truck driver.</p>
					</div>
				</div>
				<!-- Slide Two - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('http://placehold.it/1900x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Teen Driver Education</h3>
						<p>Give your teen the tools to become a proactive driver.</p>
					</div>
				</div>
				<!-- Slide Three - Set the background image for this slide in the line below -->
				<div class="carousel-item"
					style="background-image: url('http://placehold.it/1900x1080')">
					<div class="carousel-caption d-none d-md-block">
						<h3>Adult Driving Lessons</h3>
						<p>Start your training today!</p>
					</div>
				</div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators"
				role="button" data-slide="prev"> <span
				class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="sr-only">Previous</span>
			</a> <a class="carousel-control-next" href="#carouselExampleIndicators"
				role="button" data-slide="next"> <span
				class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="sr-only">Next</span>
			</a>
		</div>
	</header>


	<!-- Page Content -->
	<div class="container">

		<h1 class="my-4"></h1>

		<!-- Marketing Icons Section -->
		<div class="row">
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">CDL A Truck Training</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Segment 1</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Reiciendis ipsam eos, nam perspiciatis natus
							commodi similique totam consectetur praesentium molestiae atque
							exercitationem ut consequuntur, sed eveniet, magni nostrum sint
							fuga.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
			<div class="col-lg-4 mb-4">
				<div class="card h-100">
					<h4 class="card-header">Segment 2</h4>
					<div class="card-body">
						<p class="card-text">Lorem ipsum dolor sit amet, consectetur
							adipisicing elit. Sapiente esse necessitatibus neque.</p>
					</div>
					<div class="card-footer">
						<a href="#" class="btn btn-primary">Learn More</a>
					</div>
				</div>
			</div>
		</div>
		<!-- /.row -->

		<!-- Features Section -->
		<div class="row">
			<div class="col-lg-6">
				<h2>Visit us to get to know us more!</h2>
				<p>The Modern Business template by Start Bootstrap includes:</p>
				<ul>
					<li><strong>Bootstrap v4</strong></li>
					<li>jQuery</li>
					<li>Font Awesome</li>
					<li>Working contact form with validation</li>
					<li>Unstyled page elements for easy customization</li>
				</ul>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
					Corporis, omnis doloremque non cum id reprehenderit, quisquam totam
					aspernatur tempora minima unde aliquid ea culpa sunt. Reiciendis
					quia dolorum ducimus unde.</p>
			</div>
			<div class="col-lg-6">
				<div id="map" class="img-fluid rounded"></div>
			</div>
		</div>
		<!-- /.row -->
	</div>


	<p>

		<!-- Footer -->
	<footer class="py-5 bg-dark">
		<div class="container">
			<p class="m-0 text-center text-white">Copyright &copy;
				Polyservice Inc. 2018</p>
		</div>
		<!-- /.container -->
	</footer>
	
<script src="resources/js/home.js"></script>

</body>
</html>