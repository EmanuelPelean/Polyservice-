var address;
$(document).on('change', '#address', function() {
  address = $('#address').val();
});

var aptNum;
$(document).on('change', '#aptNum', function() {
  aptNum = $('#aptNum').val();
});

var city;
$(document).on('change', '#city', function() {
  city = $('#city').val();
});

var state;
$(document).on('change blur', '#state', function() {
  state = $('#state option:selected').val();
});



var zip;
$(document).on('change', '#zip', function() {
  zip = $('#zip').val();
});

var id;
var email;
var dataReg = {};
var dataCourse = {}
var dataMed = {}
var dataGuard = {}


$(document).on('change', '#inputHours', function() {

  if ($('#inputHours').val() >= 30) {
    alert("your hours are all set!");
  } else {
    alert("go drive some more you lazy bum!");
  }

});


$("#studentUserId").val(id);

$(document).on('change', '#sameAddressCheck', function() {
  if ($('#sameAddressCheck').is(':checked')) {

    $('#guardianAddress').val(address);
    $('#guardianApt').val(aptNum);
    $('#guardianCity').val(city);
    $('#guardianState').val(state);
    $('#guardianZip').val(zip);

  } else {
    $('#guardianAddress').val("");
    $('#guardianApt').val("");
    $('#guardianCity').val("");
    $('#guardianState').val("");
    $('#guardianZip').val("");

  }
});



//Check to make sure both email inputs match
$(document).on('change', '#username', function() {

  var pass = $('#usernameInitial').val();
  var repass = $('#username').val();


  if (($('#usernameInitial').val().length == 0) || ($('#username').val().length == 0)) {
    $('#usernameInitial').addClass('is-invalid');
  } else if (pass != repass) {
    $('#usernameInitial').addClass('is-invalid');
    $('#username').addClass('is-invalid');
    $('#usernameInitial').removeClass('is-valid');
    $('#username').removeClass('is-valid');
  } else {
    $('#usernameInitial').addClass('is-valid');
    $('#username').addClass('is-valid');
    $('#usernameInitial').removeClass('is-invalid');
    $('#username').removeClass('is-invalid');
  }

});

//Check to make sure both email inputs match
$(document).on('change', '#password', function() {

  var pass = $('#passwordInitial').val();
  var repass = $('#password').val();


  if (($('#passwordInitial').val().length < 6) || ($('#password').val().length < 6)) {
    $('#passwordInitial').addClass('is-invalid');
  } else if (pass != repass) {
    $('#passwordInitial').addClass('is-invalid');
    $('#password').addClass('is-invalid');
    $('#passwordInitial').removeClass('is-valid');
    $('#password').removeClass('is-valid');
  } else {
    $('#passwordInitial').addClass('is-valid');
    $('#password').addClass('is-valid');
    $('#passwordInitial').removeClass('is-invalid');
    $('#password').removeClass('is-invalid');
  }

});



//This checks the value of the program type and loads the matching course types in the program number drop down element
$(document).on('change', '#programType', function() {

  var select = document.getElementById("programNumber");
  var programCheck = $('#programType').val();

  if (programCheck != '00') {

    select.classList.remove('d-none');

    var programTypeSelection = $('#programType').val();

    select.options.length = 0;
    select.options[select.options.length] = new Option("Select Course", "none");
    const courseTypeList = firebase.database().ref("courses/");
    courseTypeList.orderByChild("program_type").equalTo(programTypeSelection).on('child_added', snap => {

      var course = snap.val();

      var courseNum = snap.key;

      select.options[select.options.length] = new Option(courseNum, courseNum);
    });

    if (programCheck == '01') {

      document.getElementById("fileUploadRow").classList.remove('d-none');
      document.getElementById("licenseRow").classList.add('d-none');
      document.getElementById("segOneSchoolRow").classList.add('d-none');
      document.getElementById("licenseDateRow").classList.add('d-none');
      document.getElementById("hoursRow").classList.add('d-none');

      document.getElementById('exampleFormControlFile1').prop('required', true);
      document.getElementById('licenseNum').prop('required', false);
      document.getElementById('segOneSchool').prop('required', false);
      document.getElementById('permitDate').prop('required', false);
      document.getElementById('inputHours').prop('required', false);

    }

    if (programCheck == '02') {

      document.getElementById("fileUploadRow").classList.add('d-none');
      document.getElementById("licenseRow").classList.remove('d-none');
      document.getElementById("segOneSchoolRow").classList.remove('d-none');
      document.getElementById("licenseDateRow").classList.remove('d-none');
      document.getElementById("hoursRow").classList.remove('d-none');

      document.getElementById('exampleFormControlFile1').prop('required', false);
      document.getElementById('licenseNum').prop('required', true);
      document.getElementById('segOneSchool').prop('required', true);
      document.getElementById('permitDate').prop('required', true);
      document.getElementById('inputHours').prop('required', true);

    }




  } else if ($('#programType').val() == '00') {

    document.getElementById("programNumber").classList.add('d-none');
    document.getElementById("fileUploadRow").classList.add('d-none');
    document.getElementById("licenseRow").classList.add('d-none');
    document.getElementById("segOneSchoolRow").classList.add('d-none');
    document.getElementById("licenseDateRow").classList.add('d-none');
    document.getElementById("hoursRow").classList.add('d-none');
  }
});



function updateUserFB() {
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
      user.providerData.forEach(function(profile) {
        console.log("Sign-in provider: " + profile.providerId);
        console.log("  Provider-specific UID: " + profile.uid);
        console.log("  Name: " + profile.displayName);
        console.log("  Email: " + profile.email);

        const dbUsersRef = firebase.database().ref().child('users').child(user.uid);

        dbUsersRef.set({

          full_name: (fName + " " + lName),
          date_of_birth: birthDate,
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

    if (firebaseUser) {
      console.log("in firebase auth");
      console.log(firebaseUser.uid);
      id = firebaseUser.uid;
      console.log(firebaseUser.email);

    } else {
      console.log("not logged in");
    }
  });

};

function addStudentToCourse() {
  var progNum = $("#programNumber").val();
  var user = firebase.auth().currentUser;
  const id = user.uid;
  const name = user.displayName;

  const dbStudentsRef = firebase.database().ref('courses/' + progNum + '/' + 'students_enrolled/' + id);

  dbStudentsRef.set({

    student_name: name

  });
}

function submitStudentInfo() {
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

  console.log(dataReg);

  $.ajax({
    type: "POST",
    contentType: "application/json",
    url: "studentInfoFormSubmit.html",
    data: JSON.stringify(dataReg),
    dataType: 'json',
    timeout: 600000,
    success: function(data) {
      console.log('something went right!!');
    },
    error: function(e) {
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
  $('input[name=gender][value=' + dataReg["gender"] + ']').prop('checked', true);
}

function submitCourseInfo() {
  console.log("we are in the course form")
  dataCourse["studentID"] = id;
  dataCourse["schoolAttending"] = $("#schoolAttending").val();
  dataCourse["programType"] = $("#programType").val();
  dataCourse["programNumber"] = $("#programNumber").val();
  dataCourse["licenseNum"] = $("#licenseNum").val();
  dataCourse["segOneSchool"] = $("#segOneSchool").val();
  dataCourse["permitDate"] = $("#permitDate").val();
  dataCourse["inputHours"] = $("#inputHours").val();

  console.log(dataCourse);
  
  $.ajax({
    type: "POST",
    contentType: "application/json",
    url: "courseInfoFormSubmit.htm",
    data: JSON.stringify(dataCourse),
    dataType: 'json',
    timeout: 600000,
    success: function(data) {
      console.log('something went right!!');
    },
    error: function(e) {
      console.log('there definitely was an error' + e);
    }
  });
}

function getCourseInfo() {


  $("#schoolAttending").val(dataCourse["schoolAttending"]);
  $("#programType").val(dataCourse["programType"]);
  $("#programNumber").val(dataCourse["programNumber"]);
  $("#licenseNum").val(dataCourse["licenseNum"]);
  $("#segOneSchool").val(dataCourse["segOneSchool"]);
  $("#permitDate").val(dataCourse["permitDate"]);
  $("#inputHours").val(dataCourse["inputHours"]);
}

function submitMedicalInfo() {
  console.log("we are in the medical form")
  dataMed["studentID"] = id;
  dataMed["accommodations"] = $("#accommodations").val();
  dataMed["medication"] = $("#medication").val();
  dataMed["disability"] = $("#disability").val();
  dataMed["seizure"] = $("#seizure").val();
  dataMed["driveStatus"] = $("#driveStatus").val();

  console.log(dataMed);
  
  $.ajax({
    type: "POST",
    contentType: "application/json",
    url: "medicalInfoFormSubmit.htm",
    data: JSON.stringify(dataMed),
    dataType: 'json',
    timeout: 600000,
    success: function(data) {
      console.log('something went right!!');
    },
    error: function(e) {
      console.log('there definitely was an error' + e);
    }
  });
}

function getMedicalInfo() {
  $("#accommodations").val(dataMed["accommodations"]);
  $("#medication").val(dataMed["medication"]);
  $("#disability").val(dataMed["disability"]);
  $("#seizure").val(dataMed["seizure"]);
  $("#driveStatus").val(dataMed["driveStatus"]);

}


function submitGuardianInfo() {
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

  console.log(dataGuard);
  
  $.ajax({
    type: "POST",
    contentType: "application/json",
    url: "guardianFormSubmit.htm",
    data: JSON.stringify(dataGuard),
    dataType: 'json',
    timeout: 600000,
    success: function(data) {
      console.log('something went right!!');
    },
    error: function(e) {
      console.log('there definitely was an error' + e);
    }
  });

  window.location = 'http://polyservice-demo.us-east-2.elasticbeanstalk.com/dashboard';
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

function studentInfoFormRetrieve() {
  console.log("we are in the get student info form")
  var data = {}
  data["studentID"] = id;

  $.ajax({
    type: "POST",
    contentType: "application/json",
    url: "getStudentInfo.htm",
    data: JSON.stringify(data),
    dataType: 'json',
    timeout: 600000,
    success: function(data) {
      console.log('something went right!!');
    },
    error: function(e) {
      console.log('there definitely was an error' + e);
    }
  });
}


/* ProgressBar - Functions for setting the current step.
Allows for multiple Progress Bars per page (for whatever reason that may be desirable).
Uses JQuery */
var ProgressBar = function(p_strId) {
  this._id = p_strId;

  var target = document.getElementById("target");

  var step1 = document.getElementById("step1");
  var step2 = document.getElementById("step2");
  var step3 = document.getElementById("step3");
  var step4 = document.getElementById("step4");
  var step5 = document.getElementById("step5");


  /*
   * Set the current step in the progress bar @param p_iStep The current step;
   * not zero-based to match with visible step numbers @return true, if
   * current step could be set; false otherwise
   */
  this.setStep = function(p_iStep) {
    if (p_iStep === undefined || p_iStep.isNaN) {
      console.error("setStep() called with non-number argument");
      return false;
    }
    var l_aLi = $("#" + this._id + " li");
    if (p_iStep > 0 && p_iStep <= l_aLi.length) {
      $("#" + this._id + " .current").removeClass("current");
      l_aLi[p_iStep - 1].className = "current";
      $("#" + this._id + " .current").nextAll().addClass("todo");

      currentStep = $("#" + this._id + " .current").attr('id');

      checkStep(currentStep);

      return true;
    }
    return false;
  };

  // Next:
  this.nextStep = function() {
    var l_oCurr = $("#" + this._id + " li.current");
    if (l_oCurr.next().length == 0)
      return false;
    l_oCurr.removeClass("current");
    l_oCurr.next().removeClass("todo");
    l_oCurr.next().addClass("current");

    $("#" + this._id + " .current").nextAll().addClass("todo");

    currentStep = $("#" + this._id + " .current").attr('id');

    checkStep(currentStep);

    return true;
  };

  // Back:
  this.prevStep = function() {
    var l_oCurr = $("#" + this._id + " li.current");

    if (l_oCurr.prev().length == 0)
      return false;
    l_oCurr.removeClass("current");
    l_oCurr.prev().removeClass("todo");
    l_oCurr.prev().addClass("current");

    $("#" + this._id + " .current").nextAll().addClass("todo");

    currentStep = $("#" + this._id + " .current").attr('id');

    checkStep(currentStep);

    return true;
  };

  function checkStep(step) {
    if (step == 'li_1') {
      replaceDivElem(target, 'step1');

      var form = document.getElementById('credentialsForm');
      form.addEventListener('submit', function(
        event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          alert("form is not valid");
        }
        form.classList.add('was-validated');

        if (form.checkValidity() === true) {
          alert("form is valid!!");
          pbar2.nextStep();
        }
      }, false);

    } else if (step == 'li_2') {
      replaceDivElem(target, 'step2');

      var form = document.getElementById('studentRegistrationForm');
      form.addEventListener('submit', function(
        event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          alert("form is not valid");
        }
        form.classList.add('was-validated');

        if (form.checkValidity() === true) {
          alert("form is valid!!");
          submitStudentInfo();
          pbar2.nextStep();
        }
      }, false);

    } else if (step == 'li_3') {
      replaceDivElem(target, 'step3');

      var form = document.getElementById('courseInformationForm');
      form.addEventListener('submit', function(
        event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          alert("form is not valid");
        }
        form.classList.add('was-validated');

        if (form.checkValidity() === true) {
          alert("form is valid!!");
          submitCourseInfo();
          pbar2.nextStep();
        }
      }, false);

    } else if (step == 'li_4') {
      replaceDivElem(target, 'step4');

      var form = document.getElementById('medicalInformationForm');
      form.addEventListener('submit', function(
        event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          alert("form is not valid");
        }
        form.classList.add('was-validated');

        if (form.checkValidity() === true) {
          alert("form is valid!!");
          submitMedicalInfo();
          pbar2.nextStep();
        }
      }, false);

    } else if (step == 'li_5') {
      replaceDivElem(target, 'step5');

      var form = document.getElementById('guardianInformationForm');
      form.addEventListener('submit', function(
        event) {
        if (form.checkValidity() === false) {
          event.preventDefault();
          alert("form is not valid");
        }
        form.classList.add('was-validated');

        if (form.checkValidity() === true) {
          alert("form is valid!!");
          submitGuardianInfo();

        }
      }, false);
    }
  }


  function replaceDivElem(target, source) {
    target.innerHTML = document.getElementById(source).innerHTML;
  }


}; // end of ProgressBar

//Initialize
var pbar2 = new ProgressBar("id_progressbar2");
pbar2.setStep(1);