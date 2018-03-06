
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Modify Course</title>

<!-- Firebase -->
<script src="https://www.gstatic.com/firebasejs/4.8.1/firebase.js"></script>

<!-- Latest compiled and minified Bootstrap CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"
	integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />

<link href="resources/css/modifycourse.css" type="text/css"
	rel="stylesheet">
<!-- Include Required Prerequisites -->
<script type="text/javascript"
	src="//cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/bootstrap/3/css/bootstrap.css" />

<!-- Include Date Range Picker -->
<script type="text/javascript"
	src="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.js"></script>
<link rel="stylesheet" type="text/css"
	href="//cdn.jsdelivr.net/bootstrap.daterangepicker/2/daterangepicker.css" />

<link
	href="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css" media="all"
	href="resources/css/daterangepicker.css" />
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.11.3.min.js"></script>
<script type="text/javascript"
	src="http://netdna.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src="resources/js/moment.js"></script>
<script type="text/javascript" src="resources/js/daterangepicker.js"></script>

</head>
<body>


	<h3>Modify Course Page</h3>
	<div class="container">


		<input id="programNumber" type="text" placeholder="Program Number"
			class=""> <label for="Program Type"></label> <select
			id="programType">
			<option value="">Program Type</option>
			<option value="01">Segment 1</option>
			<option value="02">Segment 2</option>
		</select><br> <br> <input id="instructor" type="text"
			placeholder="Course Instructor" class=""><br> <input
			id="maxStudents" type="text" placeholder="Max Students Limit"><br>

		<input id="currentStudents" type="hidden" class=""><br> <br>

		<label class="col-md-2 control-label">Course Dates | Times</label><br>
		<input type="text" name="daterangeme" id="date"
			value="01/01/2018 - 01/31/2018" /><br>

		<div class="container">
			<div class="col-md-1">
				<div class="form-group">
					<label class="control-label" for="WorkWeek">Week #1</label> <input
						name="WorkWeek" class="form-control days-of-week" id="week1"
						type="text" value="       " data-bind="value: WorkWeek">
				</div>
			</div>
			<div class="col-md-1">
				<div class="form-group">
					<label class="control-label" for="WorkWeek">Week #2</label> <input
						name="WorkWeek" class="form-control days-of-week" id="week2"
						type="hidden" value="       " data-bind="value: WorkWeek">
				</div>
			</div>
			<div class="col-md-1">
				<div class="form-group">
					<label class="control-label" for="WorkWeek">Week #3</label> <input
						name="WorkWeek" class="form-control days-of-week" id="week3"
						type="hidden" value="       " data-bind="value: WorkWeek">
				</div>
			</div>
		</div>

		<button id="addCourse" class="btn btn-action"
			data-ng-click="ShowId($event)">Create Course</button>

	</div>


	<div id="divMasterDetailWrapper">

		<div class="container">
			<div class="row">
				<div id="divMasterView" class="col-md-4">
					<h3>Courses</h3>
					<div id="testlist" class="list-group"></div>
				</div>
				<div id="divDetailView">
					<button id="deleteCourse">Delete Course</button>

					<pre id="objectDetail">
					</pre>
				</div>
			</div>
		</div>
	</div>

	<!-- The Modal -->
	<div id="myModal" class="modal">

		<!-- Modal content -->
		<div class="modal-content">
			<div class="modal-header">
				<h2>Delete Course</h2>
				<span class="close">&times;</span>
			</div>
			<div class="modal-body">
				<p id="deleteConfirmInfo"></p>
				<div id="btnContainer">
					<button id="btnNo">No</button>
					<button id="btnYes">Yes</button>
				</div>
			</div>
		</div>

	</div>



	<script src="resources/js/config.js"></script>
	<script src="resources/js/modifycourse.js"></script>

	<!-- Popper -->
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.3/umd/popper.min.js"
		integrity="sha384-vFJXuSJphROIrBnz7yo7oB41mKfc8JzQZiCq4NCceLEaO4IHwicKwpJf9c9IpFgh"
		crossorigin="anonymous"></script>

	<!-- Latest compiled and minified Bootstrap JavaScript -->
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"
		integrity="sha384-alpBpkh1PFOepccYVYDB4do5UnbKysX5WZXm3XxPqe5iKTfUKjNkCk9SaVuEZflJ"
		crossorigin="anonymous"></script>

</body>
</html>