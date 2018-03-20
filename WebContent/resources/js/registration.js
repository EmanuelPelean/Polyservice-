var address;
var aptNum;
var city;
var state;
var zip;
var id;
var email;
var dataReg = {};
var dataCourse = {}
var dataMed = {}
var dataGuard = {}

$(document).on('change', '#inputHours', function () {
	var inputHours = document.getElementById('inputHours');
	 if (inputHours > 30) {
		 
	 }

	});

(function() {
	
	$("#studentUserId").val(id);
	
	$(document).on('change', '#sameAddressCheck', function () {
		if ($('#sameAddressCheck').is(':checked')) {
			
			$(document).on('change', '#address', function () {
				   address = document.getElementById('address');
				});

			$(document).on('change', '#aptNum', function () {
				aptNum = document.getElementById('aptNum');
				});

			$(document).on('change', '#city', function () {
				city = document.getElementById('city');
				});

			$(document).on('change', '#state', function () {
				state = document.getElementById('state');
				});

			$(document).on('change', '#zip', function () {
				zip = document.getElementById('zip');
				});
			
			$(document).on('change', '#programType', function () {
				showProgram();
				});
			
		} else {
			$('#guardianAddress').val("");
			$('#guardianApt').val("");
			$('#guardianCity').val("");
			$('#guardianState').val("");
			$('#guardianZip').val("");
			
		}  
		});
	
})

function updateUserFB(){
	// Get elements values
	var fName = $('#firstName').val();
	var lName = $('#lastName').val();
	var birthDate = $("#birth_date").val();
	
	var user = firebase.auth().currentUser;

	  user.updateProfile({
		  displayName: (fName + " " + lName)
		}).then(function() {
		  // Update successful.
			console.log('Update successful.');
			
			if (user != null) {
			  user.providerData.forEach(function (profile) {
			    console.log("Sign-in provider: " + profile.providerId);
			    console.log("  Provider-specific UID: " + profile.uid);
			    console.log("  Name: " + profile.displayName);
			    console.log("  Email: " + profile.email);

			    const dbUsersRef = firebase.database().ref().child('users').child(user.uid);
			    
			    dbUsersRef.set({
					  
					    full_name: (fName + " " + lName),
					    date_of_birth:  birthDate,
					    email: user.email
					  
					});
			  });
			}
			
		}).catch(function(error) {
		  // An error happened.
			console.log('Error updating user info!');

		});
	
	
}

function signUp() {
	  
		  // Get email and pass
		  // TODO: Check for real email
		  email = $("#username").val();
		  const pass = $("#password").val();
		  const auth = firebase.auth();
		  
		  console.log('in the signup function');
		  // Sign in
		  const promise = auth.createUserWithEmailAndPassword(email, pass);
		  promise.catch(e => console.log(e.message));
	
	
		  // Add a realtime listener
		  firebase.auth().onAuthStateChanged(firebaseUser => {
			  
		 if(firebaseUser) {
			 console.log ("in firebase auth");
			console.log(firebaseUser.uid);
			id = firebaseUser.uid;
			console.log(firebaseUser.email);
			 
		 } else {
			 console.log ("not logged in");
		 } 
	  });
	  
	  };


	  function showProgram() {
	  	var select = document.getElementById("programNumber");
	  	
	  	if (programType.value != '00'){
	  		
	  		 document.getElementById("programNumber").classList.remove('d-none');
	  		 programTypeSelection = programType.value;
	  		 
	  		 document.getElementById('programNumber').options.length = 0;
	  		 select.options[select.options.length] = new Option("Select Course", "none");
	  		 const courseTypeList = firebase.database().ref("courses/");
	  		 courseTypeList.orderByChild("program_type").equalTo(programTypeSelection).on('child_added', snap => {
	  			  
	  			  var course = snap.val();
	  			  
	  			  var courseNum = snap.key;
	  			  
	  				select.options[select.options.length] = new Option(courseNum, courseNum);
	  		  });
	  		 
	  	} else {
	  		document.getElementById("programNumber").classList.add('d-none');
	  	}
	  	
	  }
	  
	  
	  

	  function addStudentToCourse(){
			var progNum = $("#programNumber").val();
			var user = firebase.auth().currentUser;
			const id = user.uid;
			const name = user.displayName;
			
			const dbStudentsRef = firebase.database().ref('courses/' + progNum + '/' +'students_enrolled/' + id);

			dbStudentsRef.set({
				  
			  student_name : name
			  
			});
		}
	  
function submitStudentInfo(){
	console.log("we are in the student form")
	dataReg["studentID"] = id;
	dataReg["email"] = email;
	dataReg["firstName"] = $("#firstName").val();
	dataReg["middleName"] = $("#middleName").val();
	dataReg["lastName"] = $("#lastName").val();
	dataReg["address"] = $("#address").val();
	dataReg["aptNum"] = $("#aptNum").val();
	dataReg["city"] = $("#city").val();
	dataReg["state"] = $("#state").val();
	dataReg["zip"] = $("#zip").val();
	dataReg["birth_date"] = $("#birth_date").val();
	dataReg["exact_age"] = $("#exact_age").val();
	dataReg["phoneHome"] = $("#phoneHome").val();
	dataReg["phoneStudent"] = $("#phoneStudent").val();
	dataReg["gender"] = $("input:radio[name ='gender']:checked").val();
	

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "studentInfoFormSubmit.htm",
		data : JSON.stringify(dataReg),
		dataType : 'json',
		timeout : 600000,
		success : function(data) {
			console.log('something went right!!');
		},
		error : function(e) {
			console.log('there definitely was an error' + e);
		}
	});
	
	
}

function getStudentInfo() {
	$("#firstName").val(dataReg["firstName"]); 
	$("#middleName").val(dataReg["middleName"]); 
	$("#lastName").val(dataReg["lastName"]);
	$("#address").val(dataReg["address"]);
	$("#aptNum").val(dataReg["aptNum"]);
	$("#city").val(dataReg["city"]);
	$("#state").val(dataReg["state"]);
	$("#zip").val(dataReg["zip"]);
	$("#birth_date").val(dataReg["birth_date"]);
	$("#exact_age").val(dataReg["exact_age"]);
	$("#phoneHome").val(dataReg["phoneHome"]);
	$("#phoneStudent").val(dataReg["phoneStudent"]);
	$('input[name=gender][value=' + dataReg["gender"] + ']').prop('checked',true);
}

function submitCourseInfo(){
	console.log("we are in the course form")
	dataCourse["studentID"] = id;
	dataCourse["schoolAttending"] = $("#schoolAttending").val();
	dataCourse["programType"] = $("#programType").val();
	dataCourse["programNumber"] = $("#programNumber").val();
	dataCourse["licenseNum"] = $("#licenseNum").val();
	dataCourse["segOneSchool"] = $("#segOneSchool").val();
	dataCourse["permitDate"] = $("#permitDate").val();
	dataCourse["inputHours"] = $("#inputHours").val();

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "courseInfoFormSubmit.htm",
		data : JSON.stringify(dataCourse),
		dataType : 'json',
		timeout : 600000,
		success : function(data) {
			console.log('something went right!!');
		},
		error : function(e) {
			console.log('there definitely was an error' + e);
		}
	});
}

function getCourseInfo(){
	
	
	$("#schoolAttending").val(dataCourse["schoolAttending"]);
	$("#programType").val(dataCourse["programType"]);
	$("#programNumber").val(dataCourse["programNumber"]);
	$("#licenseNum").val(dataCourse["licenseNum"]);
	$("#segOneSchool").val(dataCourse["segOneSchool"]);
	$("#permitDate").val(dataCourse["permitDate"]);
	$("#inputHours").val(dataCourse["inputHours"]);
}

function submitMedicalInfo(){
	console.log("we are in the medical form")
	dataMed["studentID"] = id;
	dataMed["accommodations"] = $("#accommodations").val();
	dataMed["medication"] = $("#medication").val();
	dataMed["disability"] = $("#disability").val();
	dataMed["seizure"] = $("#seizure").val();
	dataMed["driveStatus"] = $("#driveStatus").val();

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "medicalInfoFormSubmit.htm",
		data : JSON.stringify(dataMed),
		dataType : 'json',
		timeout : 600000,
		success : function(data) {
			console.log('something went right!!');
		},
		error : function(e) {
			console.log('there definitely was an error' + e);
		}
	});
}

function getMedicalInfo(){
	$("#accommodations").val(dataMed["accommodations"]);
	$("#medication").val(dataMed["medication"]);
	$("#disability").val(dataMed["disability"]);
	$("#seizure").val(dataMed["seizure"]);
	$("#driveStatus").val(dataMed["driveStatus"]);

}


function submitGuardianInfo(){
	console.log("we are in the guardian form")
	dataGuard["studentID"] = id;
	dataGuard["marketing"] = $("#marketing").val();
	dataGuard["guardianName"] = $("#guardianName").val();
	dataGuard["guardianAddress"] = $("#guardianAddress").val();
	dataGuard["guardianApt"] = $("#guardianApt").val();
	dataGuard["guardianCity"] = $("#guardianCity").val();
	dataGuard["guardianState"] = $("#guardianState").val();
	dataGuard["guardianZip"] = $("#guardianZip").val();
	dataGuard["guardianPhone"] = $("#guardianPhone").val();

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "guardianFormSubmit.htm",
		data : JSON.stringify(dataGuard),
		dataType : 'json',
		timeout : 600000,
		success : function(data) {
			console.log('something went right!!');
		},
		error : function(e) {
			console.log('there definitely was an error' + e);
		}
	});
	
	 window.location = 'http://localhost:8080/Polyservice/dashboard';
}

function getGuardianInfo() {
	$("#marketing").val(dataGuard["marketing"]);
	$("#guardianName").val(dataGuard["guardianName"]);
	$("#guardianAddress").val(dataGuard["guardianAddress"]);
	$("#guardianApt").val(dataGuard["guardianApt"]);
	$("#guardianCity").val(dataGuard["guardianCity"]);
	$("#guardianState").val(dataGuard["guardianState"]);
	$("#guardianZip").val(dataGuard["guardianZip"]);
	$("#guardianPhone").val(dataGuard["guardianPhone"]);
}

function studentInfoFormRetrieve(){
	console.log("we are in the get student info form")
	var data = {}
	data["studentID"] = id;

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "getStudentInfo.htm",
		data : JSON.stringify(data),
		dataType : 'json',
		timeout : 600000,
		success : function(data) {
			console.log('something went right!!');
		},
		error : function(e) {
			console.log('there definitely was an error' + e);
		}
	});
}


