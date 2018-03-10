var address;
var aptNum;
var city;
var state;
var zip;
var id;
var email;


$(document).on('change', '#inputHours', function () {
	var inputHours = document.getElementById('inputHours');
	 if (inputHours > 30) {
		 
	 }

	});

(function() {
	
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
	
	

	$(document).on('change', '#sameAddressCheck', function () {
		if ($('#sameAddressCheck').is(':checked')) {
			
			$('#guardianAddress').val(address.value);
			if(aptNum.value != null){
				$('#guardianApt').val(aptNum.value);
			}
			$('#guardianCity').val(city.value);
			$('#guardianState').val(state.value);
			$('#guardianZip').val(zip.value);
			
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
	var data = {}
	data["studentID"] = id;
	data["email"] = email;
	data["firstName"] = $("#firstName").val();
	data["middleName"] = $("#middleName").val();
	data["lastName"] = $("#lastName").val();
	data["address"] = $("#address").val();
	data["aptNum"] = $("#aptNum").val();
	data["city"] = $("#city").val();
	data["state"] = $("#state").val();
	data["zip"] = $("#zip").val();
	data["birth_date"] = $("#birth_date").val();
	data["exact_age"] = $("#exact_age").val();
	data["phoneHome"] = $("#phoneHome").val();
	data["phoneStudent"] = $("#phoneStudent").val();
	data["gender"] = $("input:radio[name ='gender']:checked").val();

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "studentInfoFormSubmit.htm",
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


function submitCourseInfo(){
	console.log("we are in the course form")
	var data = {}
	data["studentID"] = id;
	data["schoolAttending"] = $("#schoolAttending").val();
	data["programType"] = $("#programType").val();
	data["programNumber"] = $("#programNumber").val();
	data["licenseNum"] = $("#licenseNum").val();
	data["segOneSchool"] = $("#segOneSchool").val();
	data["permitDate"] = $("#permitDate").val();
	data["inputHours"] = $("#inputHours").val();

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "courseInfoFormSubmit.htm",
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

function submitMedicalInfo(){
	console.log("we are in the medical form")
	var data = {}
	data["studentID"] = id;
	data["accommodations"] = $("#accommodations").val();
	data["medication"] = $("#medication").val();
	data["disability"] = $("#disability").val();
	data["seizure"] = $("#seizure").val();
	data["driveStatus"] = $("#driveStatus").val();

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "medicalInfoFormSubmit.htm",
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


function submitGuardianInfo(){
	console.log("we are in the guardian form")
	var data = {}
	data["studentID"] = id;
	data["marketing"] = $("#marketing").val();
	data["guardianName"] = $("#guardianName").val();
	data["guardianAddress"] = $("#guardianAddress").val();
	data["guardianApt"] = $("#guardianApt").val();
	data["guardianCity"] = $("#guardianCity").val();
	data["guardianState"] = $("#guardianState").val();
	data["guardianZip"] = $("#guardianZip").val();
	data["guardianPhone"] = $("#guardianPhone").val();

	$.ajax({
		type : "POST",
		contentType : "application/json",
		url : "guardianFormSubmit.htm",
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
	
	 window.location = 'http://localhost:8080/Polyservice/dashboard';
}



