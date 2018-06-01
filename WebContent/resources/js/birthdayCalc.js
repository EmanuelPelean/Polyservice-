$(document).on('change', '#birth_date', function() {


  var mdate = $("#birth_date").val().toString();
  var yearThen = parseInt(mdate.substring(0, 4), 10);
  var monthThen = parseInt(mdate.substring(5, 7), 10);
  var dayThen = parseInt(mdate.substring(8, 10), 10);

  var today = new Date();
  var birthday = new Date(yearThen, monthThen - 1, dayThen);

  var differenceInMilisecond = today.valueOf() - birthday.valueOf();

  var year_age = Math.floor(differenceInMilisecond / 31536000000);
  var day_age = Math.floor((differenceInMilisecond % 31536000000) / 86400000);

  if ((today.getMonth() == birthday.getMonth()) && (today.getDate() == birthday.getDate())) {
    alert("Happy Birthday!!!");
  }

  var month_age = Math.floor(day_age / 30);

  day_age = day_age % 30;

  if (isNaN(year_age) || isNaN(month_age) || isNaN(day_age)) {
    $("#exact_age").text("Invalid date of birth - Please try again!");
  } else {
    $("#exact_age").html("You are currently <div id=\"age\"><span>" + year_age + "</span> years <span>" + month_age + "</span> months <span>" + day_age + "</span> days old</div> ");
  }
});

$(document).on('change', '#permitDate', function() {

  var mdate = $("#permitDate").val().toString();
  var yearThen = parseInt(mdate.substring(0, 4), 10);
  var monthThen = parseInt(mdate.substring(5, 7), 10);
  var dayThen = parseInt(mdate.substring(8, 10), 10);

  var today = new Date();
  var birthday = new Date(yearThen, monthThen - 1, dayThen);

  var differenceInMilisecond = today.valueOf() - birthday.valueOf();

  var year_age = Math.floor(differenceInMilisecond / 31536000000);
  var day_age = Math.floor((differenceInMilisecond % 31536000000) / 86400000);

  var month_age = Math.floor(day_age / 30);

  day_age = day_age % 30;

  if (isNaN(year_age) || isNaN(month_age) || isNaN(day_age)) {
    $("#permitStatus").text("Invalid date - Please try again!");
  } else if (month_age < 3) {
    $("#permitStatus").html("You have currently only had your permit for <div id=\"age\"><span>" + month_age + "</span> months <span>" + day_age + "</span> days and do not meet the 3 month minimum requirement, please choose a later course.</div> ");

  } else {
    $("#permitStatus").html("You have currently had your permit for  <div id=\"age\"><span>" + month_age + "</span> months <span>" + day_age + "</span> days and you meet the 3 month minimum requirement!</div> ");
  }
});