(function() {
 
	// Get Elements
	  const txtEmail = document.getElementById('username');
	  const txtPassword = document.getElementById('password');
	  const btnLogin = document.getElementById('btnLogin');
	  const btnLogout = document.getElementById('btnLogout');
	  const loginLi = document.getElementById('loginLi');
	  const logoutLi = document.getElementById('logoutLi');
	  
	  // Add login event
	  btnLogin.addEventListener('click', e => {
		  // Get email and pass
		  const email = txtEmail.value;
		  const pass = txtPassword.value;
		  const auth = firebase.auth();
		  
		  // Sign in
		  const promise = auth.signInWithEmailAndPassword(email, pass);
		  promise.catch(e => console.log(e.message));
		  
		  window.location = 'http://localhost:8080/Polyservice/dashboard';
	  });
	
	
  // Add logout event
  btnLogout.addEventListener('click', e => {
	 firebase.auth().signOut();
	 
  });
  
  // Add a realtime listener
  firebase.auth().onAuthStateChanged(firebaseUser => {
	 if(firebaseUser) {
		 console.log("logged in");
		 logoutLi.classList.remove('d-none');
		 loginLi.classList.add('d-none');
		 
	 } else {
		 console.log('not logged in');
		 logoutLi.classList.add('d-none');
		 loginLi.classList.remove('d-none');
	 } 
  });
  
  }());

function initMap() {
	var polyservice = {
		lat : 42.609039,
		lng : -83.03248050000002
	};
	var map = new google.maps.Map(document.getElementById('map'), {
		zoom : 17,
		center : polyservice
	});
	
	var marker = new google.maps.Marker({
		position : polyservice,
		map : map
		
	});
}


	

