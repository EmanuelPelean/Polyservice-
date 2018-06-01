(function() {

  // Get Elements

  // Segment 1 list
  const ulList = document.getElementById('list');
  // Segment 2 list
  const ulList2 = document.getElementById('list2');

  // Create References
  const dbRefList = firebase.database().ref("courses/");

  // Sync list changes
  dbRefList.on('child_added', snap => {

    var course = snap.val();

    const liList = document.createElement('li');
    const a = document.createElement('a');
    const className = "class";

    const value_li = "li-custom"
    const value_a = "a-custom";
    liList.setAttribute(className, value_li);
    a.setAttribute(className, value_a);

    liList.appendChild(a);


    var startDate = course.course_start_date;
    const h2 = document.createElement('h2');
    const value_h2 = "h2-custom";
    h2.setAttribute(className, value_h2);


    var monthNum = startDate.substring(0, 2);
    var monthName = findMonth(monthNum);

    var startDay = startDate.substring(3, 5);
    var endDate = course.course_end_date;
    var endDay = endDate.substring(3, 5);
    var year = startDate.substring(6, 11);

    h2.innerText = (monthName + " " + startDay + "-" + endDay + ", " + year);
    liList.appendChild(a);

    a.appendChild(h2);

    const p = document.createElement('p');
    const value_p = "p-custom";
    p.setAttribute(className, value_p);
    const courseType = course.program_type;

    if (courseType == '01') {
      p.innerText = 'Segment 1';
      h2.appendChild(p);
      ulList.appendChild(liList);

    } else if (courseType == '02') {
      p.innerText = 'Segment 2';
      h2.appendChild(p);
      ulList2.appendChild(liList);
    }

    // Add the course times in the course display element
    const p_time = document.createElement('p');
    p_time.setAttribute(className, value_p);
    var courseStart = course.course_start_time;
    var courseEnd = course.course_end_time;
    var courseTimes = ('Time: ' + courseStart + "-" + courseEnd);
    p_time.innerText = courseTimes;
    a.appendChild(p_time);

  });

  // Add a realtime listener
  firebase.auth().onAuthStateChanged(firebaseUser => {
    if (firebaseUser) {

    } else {
      console.log('not logged in');
    }
  });

}());

function findMonth(month) {
  switch (month) {
    case '01':
      return "January";
      break;
    case '02':
      return "February";
      break;
    case '03':
      return "March";
      break;
    case '04':
      return "April";
      break;
    case '05':
      return "May";
      break;
    case '06':
      return "June";
      break;
    case '07':
      return "July";
      break;
    case '08':
      return "August";
      break;
    case '09':
      return "September";
      break;
    case '10':
      return "October";
      break;
    case '11':
      return "November";
      break;
    case '12':
      return "November";
      break;
    case 'undefined':
      return "Error 200";
      break;
    default:
      return "Month Should Be Here";

  }
}