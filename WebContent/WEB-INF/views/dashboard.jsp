<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Dashboard</title>
<script src="https://code.jquery.com/jquery-2.2.4.js"
	integrity="sha256-iT6Q9iMJYuQiMWNd9lDyBUStIq/8PuOW33aOqmvFpqI="
	crossorigin="anonymous"></script>
</head>
<body>
	<h2>This is the dashboard page!</h2>


	<div class="info_column">
		<div id="optionbar">
			<a href="#">Here</a>
			<form method="GET"
				onsubmit="event.preventDefault(); return loadDoc(this);">
				<input type="hidden" id="gameName" name="gameName" value="id_one">
				<input type="hidden" id="gameImg" name="gameImg" value="img_value">
				<input type="hidden" id="persona" name="persona"
					value="persona_value"> <input type="hidden" id="steamID"
					name="steamID" value="steamid"> <input type="hidden"
					id="avatar" name="avatar" value="avatar_value"> <input
					type="hidden" id="gameID" name="gameID" value="gameIDvalue">
				<input type="hidden" id="storeURL" name="storeURL"
					value="storeURL_value"> <input id="like" type="image"
					src="resources/images/likebutton.png" alt="submit" value="like">
			</form>
		</div>
	</div>
	
	

<script>
		function loadDoc(form) {
			var gameName = document.getElementById("gameName").value;
			var gameImg = document.getElementById("gameImg").value;
			var steamID = document.getElementById("steamID").value;
			var persona = document.getElementById("persona").value;
			var gameID = document.getElementById("gameID").value;
			var storeURL = document.getElementById("storeURL").value;
			var xhttp = new XMLHttpRequest();
			
			console.log(gameName + " " + steamID + " " + persona);
			
			xhttp.onreadystatechange = function() {
				if (this.readyState == 4 && this.status == 200) {
					console.log("Successful!" + this.readyState + " " + this.status);
					console.log(this.responseText);
				} else {
					console.log("error:" + this.responseText);
				}
			};
			xhttp.open("GET", "like?gameName=" + gameName + "&gameImg="
					+ gameImg + "&persona=" + persona + "&steamID=" + steamID
					+ "&gameID=" + gameID + "&storeURL=" + storeURL, true);
			xhttp.send();
		}
	</script>
	


	<script src="resources/js/config.js"></script>
	<script src="resources/js/dashboard.js"></script>
</body>
</html>

