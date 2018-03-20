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
<title>Registration</title>

<script src="https://www.gstatic.com/firebasejs/4.8.1/firebase.js"></script>
<script src="resources/js/config.js"></script>


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.6/css/bootstrap.min.css"
	integrity="sha384-rwoIResjU2yc3z8GV/NPeZWAv56rSmLldC3R/AZzGRnGxQQKnKkoFVhFQhNUwEyJ"
	crossorigin="anonymous">


<link href="https://fonts.googleapis.com/icon?family=Material+Icons"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="resources/css/modern-business.css" rel="stylesheet">

<link href="resources/css/multiple-panels.css" rel="stylesheet">

<link href="resources/css/registration.css" rel="stylesheet">

<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>


<script src="https://code.jquery.com/jquery-1.12.4.js"
	integrity="sha256-Qw82+bXyGq6MydymqBxNPYTaUXXq7c8v3CwiYwLLNXU="
	crossorigin="anonymous"></script>


</head>
<body>


	<!-- Page Content -->
	<div class="container">


		<ul id="id_progressbar2" class="progressbar2">
			<li id="li_1">Student Credentials</li>
			<li id="li_2">Student Info</li>
			<li id="li_3">Course Selection</li>
			<li id="li_4">Medical History</li>
			<li id="li_5">Parent Info</li>
		</ul>

		<div id="target"></div>

		<div id="step1" style="display: none">
			<form class="ui " id="credentialsForm" onsubmit="pbar2.nextStep()">
				<!-- Credentials Form -->
				<div class="row">

					<!-- Credentials Column -->
					<div class="col-lg-12">

						<div class="card my-4">
							<h5 class="card-header">Student Login Credentials</h5>
							<div class="card-body"></div>
							<div class="row ">
								<div class="col-lg-4 center">
									<div class="control-group form-group">
										<div class="controls">
											<label>Email:</label> <input id="username"
												class="form-control" name="username" type="text"></input>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-4 center">
									<div class="control-group form-group">
										<div class="controls">
											<label>Password:</label> <input id="password"
												class="form-control" name="password" type="password"></input>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="control-group form-group">
										<div id="stepBtns" class="controls">
											<input id="btnSignUp" type="submit"
												onClick="return signUp();" value="Begin Registration"
												class="btn btn-primary">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</form>

		</div>



		<div id="step2" style="display: none">

			<form class="ui studentInfoForm" id="studentRegistrationForm"
				onsubmit="pbar2.nextStep(); getCourseInfo();">

				<!-- Registration Form -->
				<div class="row">

					<!-- Registration Content Column -->
					<div class="col-lg-12">

						<div class="card my-4">
							<h5 class="card-header">Student Info</h5>
							<div class="card-body">

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>First Name: ${name}
													</input></label> <input id="firstName"
													class="form-control" name="firstName" type="text"
													required="required" value="${resultDto.firstName}"
													></input>
												<div class="invalid-feedback">Please provide a valid
													name.</div>
											</div>
										</div>
									</div>
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Middle Name:</label> <input id="middleName"
													name="middleName" type="text" class="form-control"></input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Last Name:</label> <input id="lastName"
													class="form-control" name="lastName" type="text"
													required="required"
													data-validation-required-message="Please enter your name."></input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>

								<hr>

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Street Address:</label> <input id="address"
													class="form-control" name="address" type="text"
													required="required"
													data-validation-required-message="Please enter your street address."></input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Apt #:</label> <input id="aptNum"
													class="form-control" name="aptNum" type="text"></input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>City:</label> <input id="city" class="form-control"
													name="city" type="text" required="required"
													data-validation-required-message="Please enter your city."></input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="control-group form-group">
											<div class="controls">
												<label>State:</label> <select id="state"
													class="form-control" name="state" required="required"
													data-validation-required-message="Please select your state.">
													<option value="MI">Michigan</option>
													<option value="AL">Alabama</option>
													<option value="AK">Alaska</option>
													<option value="AZ">Arizona</option>
													<option value="AR">Arkansas</option>
													<option value="CA">California</option>
													<option value="CO">Colorado</option>
													<option value="CT">Connecticut</option>
													<option value="DE">Delaware</option>
													<option value="DC">District Of Columbia</option>
													<option value="FL">Florida</option>
													<option value="GA">Georgia</option>
													<option value="HI">Hawaii</option>
													<option value="ID">Idaho</option>
													<option value="IL">Illinois</option>
													<option value="IN">Indiana</option>
													<option value="IA">Iowa</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
													<option value="LA">Louisiana</option>
													<option value="ME">Maine</option>
													<option value="MD">Maryland</option>
													<option value="MA">Massachusetts</option>
													<option value="MN">Minnesota</option>
													<option value="MS">Mississippi</option>
													<option value="MO">Missouri</option>
													<option value="MT">Montana</option>
													<option value="NE">Nebraska</option>
													<option value="NV">Nevada</option>
													<option value="NH">New Hampshire</option>
													<option value="NJ">New Jersey</option>
													<option value="NM">New Mexico</option>
													<option value="NY">New York</option>
													<option value="NC">North Carolina</option>
													<option value="ND">North Dakota</option>
													<option value="OH">Ohio</option>
													<option value="OK">Oklahoma</option>
													<option value="OR">Oregon</option>
													<option value="PA">Pennsylvania</option>
													<option value="RI">Rhode Island</option>
													<option value="SC">South Carolina</option>
													<option value="SD">South Dakota</option>
													<option value="TN">Tennessee</option>
													<option value="TX">Texas</option>
													<option value="UT">Utah</option>
													<option value="VT">Vermont</option>
													<option value="VA">Virginia</option>
													<option value="WA">Washington</option>
													<option value="WV">West Virginia</option>
													<option value="WI">Wisconsin</option>
													<option value="WY">Wyoming</option>
												</select>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
									<div class="col-lg-2">
										<div class="control-group form-group">
											<div class="controls">
												<label>Zip Code:</label> <input id="zip"
													class="form-control" name="zip" type="text" maxlength="5"
													required="required"
													data-validation-required-message="Please enter your zip code."></input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>

								<hr>

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Date of Birth:</label> <input id="birth_date"
													class="form-control" name="firstName" type="date" required
													data-validation-required-message="Please enter your name."></input>
											</div>
										</div>
									</div>
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Age:</label> <span id="exact_age"
													class="form-control"></span>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Gender:</label>
												<div class="radio">
													<label> <input type="radio" name="gender"
														class="btn-group-toggle" value="female" /> Female
													</label> <label> <input type="radio" name="gender"
														class="btn-group-toggle" value="male" /> Male
													</label>

												</div>
											</div>
										</div>
									</div>
								</div>

								<hr>

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Student Home Phone#:</label> <input id="phoneHome"
													class="form-control input-medium bfh-phone"
													data-format="+1 (ddd) ddd-dddd" name="phoneHome"
													type="text" required="required"
													data-validation-required-message="Please enter your home phone number."></input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Student Cell Phone#:</label> <input id="phoneStudent"
													class="form-control input-medium bfh-phone"
													data-format="+1 (ddd) ddd-dddd" name="phoneStudent"
													type="text" required="required"
													data-validation-required-message="Please enter your student's cell phone number."></input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-12">
										<div class="control-group form-group">
											<div id="stepBtns" class="controls">
												<input id="nextBtn-studentInfo"
													onclick="submitStudentInfo(); updateUserFB();"
													type="submit" value="Next" class="btn btn-primary">
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>

				<!-- /.row -->
			</form>


		</div>

		<div id="step3" style="display: none">
			<form class="ui courseInfoForm" id="courseInformationForm"
				onsubmit="pbar2.nextStep(); getMedicalInfo();">

				<!-- Course Info Form -->
				<div class="row">


					<!-- Course Info Content Column -->
					<div class="col-lg-12">

						<div class="card my-4">
							<h5 class="card-header">Course Selection</h5>
							<div class="card-body">


								<div class="col-lg-5">
									<div class="control-group form-group">
										<div class="controls">
											<label>Which school do you currently attend?</label> <select
												id="schoolAttending" class="form-control"
												name="schoolAttending" required="required"
												data-validation-required-message="Current school attending">
												<option value="00">Select School</option>
												<option value="Advancepath Academy">Advancepath
													Academy</option>
												<option value="Athens High School">Athens High
													School</option>
												<option value="Bemis Junior High School">Bemis
													Junior High School</option>
												<option value="Chippewa Valley High School">Chippewa
													Valley High School</option>
												<option value="Clintondale High School">Clintondale
													High School</option>
												<option value="Cousino High School">Cousino High
													School</option>
												<option value="Dakota High School">Dakota High
													School</option>
												<option value="Davis Junior High School">Davis
													Junior High School</option>
												<option value="Eisenhower High School">Eisenhower
													High School</option>
												<option value="Eppler Junior High School">Eppler
													Junior High School</option>
												<option value="Frank Jeannette Junior High School">Frank
													Jeannette Junior High School</option>
												<option value="Fraser High School">Fraser High
													School</option>
												<option value="Henry Ford II High School">Henry
													Ford II High School</option>
												<option value="Heritage Junior High School">Heritage
													Junior High School</option>
												<option value="Home School">Home School</option>
												<option value="International Academy of Macomb">International
													Academy of Macomb</option>
												<option value="Lamphere High School">Lamphere High
													School</option>
												<option value="Malow Junior High School">Malow
													Junior High School</option>
												<option value="Mount Clemens High School">Mount
													Clemens High School</option>
												<option value="Rochester Adams High School">Rochester
													Adams High School</option>
												<option value="Rochester High School">Rochester
													High School</option>
												<option value="Shelby Junior High School">Shelby
													Junior High School</option>
												<option value="Sterling Heights High School">Sterling
													Heights High School</option>
												<option value="Stevenson High School">Stevenson
													High School</option>
												<option value="Stoney Creek High School">Stoney
													Creek High School</option>
												<option value="Troy High School">Troy High School</option>
												<option value="Utica High School">Utica High School</option>
												<option value="Utica Learning Academy">Utica
													Learning Academy</option>
												<option value="Warren Mott High School">Warren Mott
													High School</option>
												<option value="Other">Other</option>

											</select>
											<p class="help-block"></p>
										</div>
									</div>
								</div>
								<hr>

								<div class="col-lg-5">
									<div class="control-group form-group">
										<div class="controls">
											<label for="Program Type"></label> <select id="programType"
												onchange="showProgram()" name="programType"
												class="form-control" required="required">
												<option value="00">Program Type</option>
												<option value="01">Segment 1</option>
												<option value="02">Segment 2</option>
											</select>
											<p class="help-block"></p>
										</div>
									</div>
								</div>

								<br>

								<div class="col-lg-5">
									<div class="control-group form-group">
										<div class="controls">
											<label for="programNumber"></label> <select
												id="programNumber" name="programNumber"
												class="d-none form-control" required="required">
												<option value="">Select Course</option>
											</select>
											<p class="help-block"></p>
										</div>
									</div>
								</div>

								<br>

								<div class="col-lg-12">
									<div class="control-group form-group">
										<div class="controls">
											<label for="exampleFormControlFile1">Please upload a
												copy of your student's birth certificate or passport for
												date of birth verification. </label> <input type="file"
												class="b-form-file" id="exampleFormControlFile1">
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>License/Permit #:</label> <input id="licenseNum"
													class="form-control" name="licenseNum" type="text"
													placeholder="i.e. W 234 543 879 948" required="required"
													data-validation-required-message="Please enter your name."></input>
												<div class="invalid-feedback">Please provide a valid
													name.</div>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Which school did you attend for Segment 1?</label> <input
													id="segOneSchool" class="form-control" name="segOneSchool"
													type="text" required="required"
													data-validation-required-message="Please enter your name."></input>
												<div class="invalid-feedback">Please provide a valid
													name.</div>
											</div>
										</div>
									</div>
								</div>


								<div class="row" id="licenseDate">
									<div class="col-lg-12">
										<div class="control-group form-group">
											<div class="controls">
												<label for="permitDate">Please select your permit
													issue date (Level 1 License). </label><i class="material-icons">&#xE887;</i>
												<input type="date" id="permitDate" required="required"
													class="form-control  col-lg-3"></input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
									<div class="col-lg-12">
										<div class="control-group form-group">
											<div class="controls">
												<label>Status:</label> <span id="permitStatus"
													class="form-control"></span>
											</div>
										</div>
									</div>
								</div>
								<div class="row">

									<div class="form-group row">
										<label for="inputHours" class="col-12 col-form-label">How
											many hours of driving have you logged so far?</label>
										<div class="col-lg-2">
											<input class="form-control" type="text" value=""
												id="inputHours" required="required"></input>
										</div>
									</div>
								</div>

							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="control-group form-group">
										<div id="stepBtns" class="controls">
											<input id="previousBtn" type="button" value="Previous"
												onclick="pbar2.prevStep(); studentInfoFormRetrieve(); getStudentInfo();"
												class="btn btn-primary"> <input id="nextBtn"
												onclick="submitCourseInfo(); addStudentToCourse();"
												type="submit" value="Next" class="btn btn-primary">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- /.row -->
			</form>

		</div>
		<div id="step4" style="display: none">
			<form class="ui medicalInfoForm" id="medicalInformationForm"
				onsubmit="pbar2.nextStep()">
				<!-- Medical History Form -->
				<div class="row">

					<!-- Medical History Content Column -->
					<div class="col-lg-12">

						<div class="card my-4">
							<h5 class="card-header">Student Medical History</h5>
							<div class="card-body"></div>
							<div class="col-lg-12">
								<div class="control-group form-group">
									<div class="controls">
										<label>Are there any special accommodations the
											student will require in order to participate in the classroom
											phase of this course? ( i.e. having exam questions read
											aloud, language interpretation, specific sitting
											arrangements, etc ...) If yes, please list below:</label>
										<div class="control-group form-group">
											<div class="controls">
												<div>
													<input type="radio" id="accommodationsY"
														name="accommodations"> <label
														for="accommodationsY">Yes*</label> <input type="radio"
														id="accommodationsN" name="accommodations"> <label
														for="accommodationsN">No</label>
												</div>
											</div>
										</div>
										<textarea rows="3" cols="100" class="form-control"
											id="accommodations" maxlength="999" style="resize: none"></textarea>
									</div>
								</div>
								<div class="control-group form-group">
									<div class="controls">
										<label>Is the student currently on any medication? If
											yes, please list the possible side effects below:</label>
										<div class="control-group form-group">
											<div class="controls">
												<div>
													<input type="radio" id="medicationY" name="medication">
													<label for="medicationY">Yes*</label> <input type="radio"
														id="medicationN" name="medication"> <label
														for="medicationN">No</label>
												</div>
											</div>
										</div>
										<textarea rows="3" cols="100" class="form-control"
											id="medication" maxlength="999" style="resize: none"></textarea>
									</div>
								</div>
								<div class="control-group form-group">
									<div class="controls">
										<label>Does the student have any physical or medical
											conditions that may possibly affect his/her ability to
											perform standard driving maneuvers? (i.e. epilepsy, asthma,
											color vision deficiency, hearing loss, etc ...) If yes,
											please list the physical conditions below:</label>
										<div class="control-group form-group">
											<div class="controls">
												<div>
													<input type="radio" id="disabilityY" name="disability">
													<label for="disabilityY">Yes*</label> <input type="radio"
														id="disabilityN" name="disability"> <label
														for="disabilityN">No</label>
												</div>
											</div>
										</div>
										<textarea rows="3" cols="100" class="form-control"
											id="disability" maxlength="999" style="resize: none"></textarea>
									</div>
								</div>
								<div class="control-group form-group">
									<div class="controls">
										<label>In the last six months, had the student
											experienced a fainting spell, "black out", seizure, or any
											other loss of consciousness? If yes, please explain below:</label>
										<div class="control-group form-group">
											<div class="controls">
												<div>
													<input type="radio" id="seizureY" name="seizure"> <label
														for="seizureY">Yes*</label> <input type="radio"
														id="seizureN" name="seizure"> <label
														for="seizureN">No</label>
												</div>
											</div>
										</div>
										<textarea rows="3" cols="100" class="form-control"
											id="seizure" maxlength="999" style="resize: none"></textarea>
									</div>
								</div>
								<div class="control-group form-group">
									<div class="controls">
										<label>Are the student's driving privileges currently
											suspended or revoked?</label>
										<div class="control-group form-group">
											<div class="controls">
												<div>
													<input type="radio" id="driveStatusY" name="driveStatus">
													<label for="driveStatusY">Yes*</label> <input type="radio"
														id="driveStatusN" name="driveStatus"> <label
														for="driveStatusN">No</label>
												</div>
											</div>
										</div>
										<textarea rows="3" cols="100" class="form-control"
											id="driveStatus" maxlength="999" style="resize: none"></textarea>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-lg-12">
									<div class="control-group form-group">
										<div id="stepBtns" class="controls">
											<input id="previousBtn" type="button" value="Previous"
												onclick="pbar2.prevStep(); getCourseInfo();" class="btn btn-primary">
											<input id="nextBtn" onclick="submitMedicalInfo(); "
												type="submit" value="Next" class="btn btn-primary">
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- /.row -->
			</form>

		</div>
		<div id="step5" style="display: none">
			<form:form action="submitGuardianInfo" method="post" model="command"
			 class="ui guardianInfoForm" id="guardianInformationForm">
			 
			 	<form:input id="studentUserId" path="studentID" type="hidden"></form:input>

				<!-- Guardian Info Form -->
				<div class="row">

					<!-- Guardian Info Content Column -->
					<div class="col-lg-12">

						<div class="card my-4">
							<h5 class="card-header">Parent/Guardian Info</h5>
							<div class="card-body">

								<div class="row">
									<div class="col-lg-12">
										<div class="control-group form-group">
											<div class="controls">
												<label>How did you find out about us?</label>
												<form:textarea rows="2" cols="100" class="form-control"
													id="marketing" path="marketing" maxlength="999" style="resize: none"></form:textarea>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Parent/Guardian Full Name:</label> <form:input
													id="guardianName" path="guardianName" class="form-control" name="guardianName"
													type="text" required="required"
													data-validation-required-message="Please enter a valid name."></form:input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-12">
										<label class="custom-control custom-checkbox"> <input
											id="sameAddressCheck" type="checkbox"
											class="custom-control-input"> <span
											class="custom-control-indicator"></span> <span
											class="custom-control-description">Check this box if
												the parent/guardian address is the same as student's
												address. </span>
										</label>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Street Address:</label> <form:input id="guardianAddress" path="guardianAddress"
													class="form-control" name="guardianAddress" type="text"
													required="required"
													data-validation-required-message="Please enter your street address."></form:input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>

									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Apt #:</label> <form:input id="guardianApt" path="guardianApt"
													class="form-control" name="guardianApt" type="text"></form:input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>

								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>City:</label> <form:input id="guardianCity" path="guardianCity"
													class="form-control" name="guardianCity" type="text"
													required="required"
													data-validation-required-message="Please enter your city."></form:input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
									<div class="col-lg-3">
										<div class="control-group form-group">
											<div class="controls">
												<label>State:</label> <form:select id="guardianState" path="guardianState"
													class="form-control" name="guardianState"
													required="required"
													data-validation-required-message="Please select your state.">
													<option value="MI">Michigan</option>
													<option value="AL">Alabama</option>
													<option value="AK">Alaska</option>
													<option value="AZ">Arizona</option>
													<option value="AR">Arkansas</option>
													<option value="CA">California</option>
													<option value="CO">Colorado</option>
													<option value="CT">Connecticut</option>
													<option value="DE">Delaware</option>
													<option value="DC">District Of Columbia</option>
													<option value="FL">Florida</option>
													<option value="GA">Georgia</option>
													<option value="HI">Hawaii</option>
													<option value="ID">Idaho</option>
													<option value="IL">Illinois</option>
													<option value="IN">Indiana</option>
													<option value="IA">Iowa</option>
													<option value="KS">Kansas</option>
													<option value="KY">Kentucky</option>
													<option value="LA">Louisiana</option>
													<option value="ME">Maine</option>
													<option value="MD">Maryland</option>
													<option value="MA">Massachusetts</option>
													<option value="MN">Minnesota</option>
													<option value="MS">Mississippi</option>
													<option value="MO">Missouri</option>
													<option value="MT">Montana</option>
													<option value="NE">Nebraska</option>
													<option value="NV">Nevada</option>
													<option value="NH">New Hampshire</option>
													<option value="NJ">New Jersey</option>
													<option value="NM">New Mexico</option>
													<option value="NY">New York</option>
													<option value="NC">North Carolina</option>
													<option value="ND">North Dakota</option>
													<option value="OH">Ohio</option>
													<option value="OK">Oklahoma</option>
													<option value="OR">Oregon</option>
													<option value="PA">Pennsylvania</option>
													<option value="RI">Rhode Island</option>
													<option value="SC">South Carolina</option>
													<option value="SD">South Dakota</option>
													<option value="TN">Tennessee</option>
													<option value="TX">Texas</option>
													<option value="UT">Utah</option>
													<option value="VT">Vermont</option>
													<option value="VA">Virginia</option>
													<option value="WA">Washington</option>
													<option value="WV">West Virginia</option>
													<option value="WI">Wisconsin</option>
													<option value="WY">Wyoming</option>
												</form:select>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
									<div class="col-lg-2">
										<div class="control-group form-group">
											<div class="controls">
												<label>Zip Code:</label> <form:input id="guardianZip" path="guardianZip"
													class="form-control" name="guardianZip" type="text"
													maxlength="5" required="required"
													data-validation-required-message="Please enter your zip code."></form:input>
												<p class="help-block"></p>
											</div>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-lg-4">
										<div class="control-group form-group">
											<div class="controls">
												<label>Parent/Guardian Phone#:</label> <form:input
													id="guardianPhone" path="guardianPhone"
													class="form-control input-medium bfh-phone"
													data-format="+1 (ddd) ddd-dddd" name="guardianPhone"
													type="text" required="required"
													data-validation-required-message="Please enter your home phone number."></form:input>
												<p class="help-block"></p>


											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-lg-12">
									<div class="control-group form-group">
										<div id="stepBtns" class="controls">
											<input id="previousBtn" type="button" value="Previous"
												onclick="pbar2.prevStep(); getMedicalInfo();" class="btn btn-primary">
											<input id="sumbitBtn"
												type="submit" value="Submit Info" class="btn btn-primary">
										</div>
									</div>
								</div>
							</div>

						</div>
					</div>
				</div>

				<!-- /.row -->
			</form:form>

		</div>

	</div>
	<!-- /.container -->





	<script src="resources/js/registration.js"></script>
	<script src="resources/js/form-phone.js"></script>
	<script src="resources/js/multiple-panels.js"></script>
	<script src="resources/js/birthdayCalc.js"></script>


</body>
</html>