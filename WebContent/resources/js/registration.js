var address;
var aptNum;
var city;
var state;
var zip;

function testMe(){
	var progNum = programNumber.value;
	var user = firebase.auth().currentUser;
	const id = user.uid;
	const name = user.displayName;

	console.log("The Id should be here " + user.uid);
	
	const dbStudentsRef = firebase.database().ref('courses/' + progNum + '/' +'students_enrolled/' + id);

	dbStudentsRef.set({
		  
	  student_name : "Frederick"
	  
	});
}

$(document).on('change', '#inputHours', function () {
	var inputHours = document.getElementById('inputHours');
	 if (inputHours > 30) {
		 
	 }

	});


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

$(document).on('change', '#sameAddressCheck', function () {
	if ($('#sameAddressCheck').is(':checked')) {
		
		$('#guardianAddress').val(address.value);
		$('#guardianApt').val(aptNum.value);
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

(function() {


  // Get Elements
  const preObject = document.getElementById('object');
  const ulList = document.getElementById('list');
  const firstName = document.getElementById('firstName');
  const lastName = document.getElementById('lastName');
  const id = document.getElementById('student');
  const email =document.getElementById('email');
  var   programType = document.getElementById('programType');
  var   programTypeSelection = programType.value;
 
  // Create References
  
  const dbRefObject = firebase.database().ref().child('object');
  
  const dbRefList = firebase.database().ref("courses/");
  
  // Add logout event
  btnLogout.addEventListener('click', e => {
	 firebase.auth().signOut();
	 window.location = 'http://localhost:8080/Polyservice';

	 
  });
  
  // Update user submit info event
  btnSubmit.addEventListener('click', e => {
	  // Get user info
	  // TODO: Check for real valid input
	  const fName = firstName.value;
	  const lName = lastName.value;
	 
  
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

		    id.value = profile.uid;
		    
		    const dbUsersRef = firebase.database().ref().child('users').child(user.uid);
		    
		    dbUsersRef.set({
				  
				    full_name: (fName + " " + lName),
				    date_of_birth: "March 1 2000",
				    email: user.email
				  
				});
		  });
		}
		
	}).catch(function(error) {
	  // An error happened.
		console.log('Error updating user info!');

	});
  });
  
  // Add a realtime listener
  firebase.auth().onAuthStateChanged(firebaseUser => {
	 if(firebaseUser) {
		 console.log(firebaseUser);
		 btnLogout.classList.remove('d-none');
		 console.log(firebaseUser.uid);
		 id.value = firebaseUser.uid;
		 email.value = firebaseUser.email;
		 
	 } else {
		 console.log('not logged in');
		 btnLogout.classList.add('d-none');
	 } 
  });
  
  }());


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


