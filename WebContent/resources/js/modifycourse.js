var idResponse = null;

$(function() {
  $('input[name="daterangeme"]').daterangepicker({
    timePicker: true,
    timePickerIncrement: 30,
    locale: {
      format: 'MM/DD/YYYY h:mm A'
    }
  });
});


(function() {


  // Get Elements
  const program = document.getElementById('programNumber');
  const ulList = document.getElementById('list');
  const studentList = document.getElementById('testlist');
  const programType = document.getElementById('programType');
  const instructor = document.getElementById('instructor');
  const studentMax = document.getElementById('maxStudents');
  const weekOne = document.getElementById('week1');
  const weekTwo = document.getElementById('week2');
  const weekThree = document.getElementById('week3');
  const courseDatesInput = document.getElementById('date');


  // Create References

  const dbRefList = firebase.database().ref("courses/");


  // Sync list changes
  dbRefList.on('child_added', snap => {

    var course = snap.val();

    // Create a list item
    const a = document.createElement('a');
    a.classList.add('list-group-item');
    a.classList.add('clearfix');
    a.innerText = snap.key + " | " + course.instructor;

    const span1 = document.createElement('span');
    span1.classList.add('pull-right');
    a.appendChild(span1);

    const span2 = document.createElement('span');
    span2.classList.add('btn');
    span2.classList.add('btn-xs');
    span2.classList.add('btn-default');
    span2.id = snap.key;

    const name = "onClick";
    const value = "reply_click(this.id)";
    span2.setAttribute(name, value);

    span1.appendChild(span2);

    const expandIcon = document.createElement('i');
    expandIcon.classList.add('fas');
    expandIcon.classList.add('fa-edit');
    span2.appendChild(expandIcon);

    studentList.appendChild(a);
  });



  dbRefList.on('child_changed', snap => {

    const liChanged = document.getElementById(snap.key);
    liChanged.innerText = JSON.stringify(snap.val(), null, 3)

  });

  dbRefList.on('child_removed', snap => {

    var course = document.getElementById(idResponse);
    var span = course.parentNode;
    var a = span.parentNode;
    a.parentNode.removeChild(a);

  });

  // Delete the selected course
  btnYes.addEventListener('click', e => {


    firebase.database().ref().child('courses').child(idResponse).remove();
    closeModal();

  })

  // Update user submit info event
  addCourse.addEventListener('click', e => {
    // Get user info
    // TODO: Check for real valid input
    const programInput = program.value;
    const typeInput = programType.value;
    const instructorInput = instructor.value;
    const maxS = studentMax.value;
    const firstWeek = weekOne.value;
    const secondWeek = weekTwo.value;
    const thirdWeek = weekThree.value;
    const courseDates = courseDatesInput.value;

    var user = firebase.auth().currentUser;

    user.updateProfile({

    }).then(function() {
      // Update successful.
      console.log('Update successful.');

      if (user != null) {
        user.providerData.forEach(function(profile) {



          console.log(courseDatesInput.value);
          console.log("This should be the same " + courseDates);

          if (courseDates.length >= 41) {
            startDate = courseDates.substr(0, 10);
            startTime = courseDates.substr(11, 8);
            endDate = courseDates.substr(22, 10);
            endTime = courseDates.substr(33, 8);
          } else {
            startDate = courseDates.substr(0, 10);
            startTime = courseDates.substr(11, 8);
            endDate = courseDates.substr(22, 10);
            endTime = courseDates.substr(32, 8);
          }

          console.log(startDate);


          const dbUsersRef = firebase.database().ref().child('courses').child(programInput);

          dbUsersRef.set({

            program_type: typeInput,
            instructor: instructorInput,
            current_students: "0",
            maximum_students: maxS,
            first_week_days: firstWeek,
            second_week_days: secondWeek,
            third_week_days: thirdWeek,
            course_start_date: startDate,
            course_end_date: endDate,
            course_start_time: startTime,
            course_end_time: endTime,
            students_enrolled: ""



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
    if (firebaseUser) {

    } else {
      console.log('not logged in');
    }
  });

}());



function reply_click(clicked_id) {


  const detailObject = document.getElementById('objectDetail');


  idResponse = clicked_id;

  const dbRefObject = firebase.database().ref('courses').child(idResponse);

  // Sync object changes
  dbRefObject.on('value', snap => {
    detailObject.innerText = JSON.stringify(snap.val(), null, 3);

  });


}

(function($) {

  "use strict";

  $.fn.daysOfWeekInput = function() {
    return this.each(function() {
      var $field = $(this);

      var days = [{
          Name: 'Su',
          Value: 'N',
          Checked: false
        },
        {
          Name: 'Mo',
          Value: 'M',
          Checked: false
        },
        {
          Name: 'Tu',
          Value: 'T',
          Checked: false
        },
        {
          Name: 'We',
          Value: 'W',
          Checked: false
        },
        {
          Name: 'Th',
          Value: 'R',
          Checked: false
        },
        {
          Name: 'Fr',
          Value: 'F',
          Checked: false
        },
        {
          Name: 'Sa',
          Value: 'S',
          Checked: false
        }
      ];

      var currentDays = $field.val().split('');
      for (var i = 0; i < currentDays.length; i++) {
        var dayA = currentDays[i];
        for (var n = 0; n < days.length; n++) {
          var dayB = days[n];
          if (dayA === dayB.Value) {
            dayB.Checked = true;
          }
        }
      }

      // Make the field hidden when in production.
      // $field.attr('type','hidden');

      var options = '';
      var n = 0;
      while ($('.days' + n).length) {
        n = n + 1;
      }

      var optionsContainer = 'days' + n;
      $field.before('<div class="days ' + optionsContainer + '"></div>');

      for (var i = 0; i < days.length; i++) {
        var day = days[i];
        var id = 'day' + day.Name + n;
        var checked = day.Checked ? 'checked="checked"' : '';
        options = options + '<div><input type="checkbox" value="' + day.Value + '" id="' + id + '" ' + checked + ' /><label for="' + id + '">' + day.Name + '</label>&nbsp;&nbsp;</div>';
      }

      $('.' + optionsContainer).html(options);

      $('body').on('change', '.' + optionsContainer + ' input[type=checkbox]', function() {
        var value = $(this).val();
        var index = getIndex(value);
        if (this.checked) {
          updateField(value, index);
        } else {
          updateField(' ', index);
        }
      });

      function getIndex(value) {
        for (i = 0; i < days.length; i++) {
          if (value === days[i].Value) {
            return i;
          }
        }
      }

      function updateField(value, index) {
        $field.val($field.val().substr(0, index) + value + $field.val().substr(index + 1)).change();
      }
    });
  }

})(jQuery);

$('.days-of-week').daysOfWeekInput();


// Get the modal
var modal = document.getElementById('myModal');

// Get the button that opens the modal
var btn = document.getElementById("myBtn");
var yes = document.getElementById('yes');
var no = document.getElementById('no');

// Get the <span> element that closes the modal
var span = document.getElementsByClassName("close")[0];

// Get the <p> element where we verify the course to delete
var info = document.getElementById('deleteCourseModalLabel');

// When the user clicks the button, open the modal
deleteCourse.onclick = function() {
  if (idResponse != null) {
    info.innerText = ("Are you sure you want to PERMANENTLY DELETE course " + idResponse + "?");
  } else {
    console.log('error - no course selected!');
  }
}